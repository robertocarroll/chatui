#### Description:
#   Respond to custom answers
#
# Dependencies:
#   redis-brain.coffee
#
# Configuration:
#   None
#
# Command:
#
# Author:
#   Robert Carroll

moment = require 'moment'
_ = require('underscore')

initial_question_bank = {
	1: {question: "What's the quietest thing you can hear?", my_answer: '', answers: []},
	2: {question: "What one word would you use to describe me?", my_answer: '', answers: []}
	3: {question: "What makes me unique?", my_answer: '', answers: []}
}

# Varied response
response_to_answer = ["I see. ", "Interesting. "]

# Varied conjunction
conjunction = ["Here's another question for you. ", "Another question for you. "]

module.exports = (robot) ->
	robot.brain.on 'loaded', =>
		robot.logger.info "Loading knowledge"
		robot.brain.data.questions ?= {}

		# if _.isUndefined(robot.brain.data.questions) then 
		robot.brain.data.questions = initial_question_bank
		question_bank = robot.brain.data.questions
		current_question = null
		question_ids = Object.keys(question_bank)
		used_questions = []

		# Fisher-Yates shuffle in Coffeescript https://gist.github.com/smrchy/3098096
		shuffle = (a) ->
    i = a.length
    while --i > 0
        j = ~~(Math.random() * (i + 1))
        t = a[j]
        a[j] = a[i]
        a[i] = t
    a

		getQuestion = (cb) -> 
			shuffle (question_ids)
			current_question = question_ids[0]
			if _.isUndefined(current_question)
				question_text = "Thanks for talking to me. "
			else 	 			
				used_questions.push current_question
				question_ids = _.difference(question_ids, used_questions)
				question_text = question_bank[current_question].question
			cb question_text

		robot.hear /chat/i, (msg) ->
			getQuestion (question_text) ->  			
				msg.send question_text

		robot.hear /answer (.*)$/i, (msg) ->
			answer = msg.match[1]
			current_question_answers = question_bank[current_question].answers
			current_question_answers.push answer
			answers_without_current = current_question_answers.filter (exclude_current) -> exclude_current isnt answer	
			shuffled_answer = shuffle (answers_without_current)
			getQuestion (question_text) ->
				robot.logger.info robot.brain.data.questions
				msg.send [msg.random response_to_answer] + [if shuffled_answer.length > 0 then 'Someone else told me ' + "'" + shuffled_answer[0] + "'. "] + question_text
