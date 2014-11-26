# Description:
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
#   NNA

moment = require 'moment'

question_bank = [
		{
			id: 0
			question: "What's the quietest thing you can hear?"
			answers: []
		}
		{
			id: 1
			question: "What makes me unique? "
			answers: []
		}
		{
			id: 2
			question: "What one word would you use to describe me?"
			answers: []
		}
	]	

# Varied response
response = [
	"I see. ",
	"Interesting. "
]	

module.exports = (robot) ->
	robot.brain.on 'loaded', =>
		robot.logger.info "Loading knowledge"
		robot.brain.data.questions ?= []

		robot.brain.data.questions = question_bank unless robot.brain.data.questions.length
		current_question = null

		# Fisher-Yates shuffle in Coffeescript https://gist.github.com/smrchy/3098096
		shuffle = (a) ->
    i = a.length
    while --i > 0
        j = ~~(Math.random() * (i + 1))
        t = a[j]
        a[j] = a[i]
        a[i] = t
    a

		robot.hear /chat/i, (msg) ->
			# get the IDs of all the questions	
			question_id = (get_question.id for get_question in robot.brain.data.questions)
			robot.logger.info question_id
			# generate a random question ID 
			shuffle (question_id) 
			current_question = question_id[0]
			robot.logger.info current_question
			# need to remove the current question id from the question_id so it isn't repeated 

			# ask the question 
			msg.send robot.brain.data.questions[current_question].question

		robot.hear /answer (.*)$/i, (msg) ->
			date = moment().unix()
			answer = msg.match[1]
			new_answer = {date: date, answer: answer}
			for key,value of robot.brain.data.questions
				if current_question == value.id
					value.answers.push new_answer 
					robot.logger.info robot.brain.data.questions[current_question].answers
			newArr = robot.brain.data.questions[current_question].answers.filter (word) -> word isnt new_answer				
			shuffled_answer = shuffle (newArr)	
			robot.logger.info shuffled_answer		
			msg.send [msg.random response] + [if shuffled_answer.length > 1 then 'Someone else told me ' + shuffled_answer[0].answer]

		# Add a new question via Hubot 	
		robot.respond /question (.*)$/i, (msg) ->
			question_value = msg.match[1]
			next_id = robot.brain.data.questions.length    
			new_question = {id:next_id, question: question_value, answers: []}
			robot.brain.data.questions.push new_question
			msg.send "OK, I've added \"#{question_value}\" as a new question"

		# Remove an existing question via Hubot 	
		robot.respond /remove (.*)$/i, (msg) ->
			question_cull = msg.match[1]
			robot.logger.info question_cull	
			robot.brain.data.questions.splice(question_cull, 1)
			msg.send "OK, I've removed question ID \"#{question_cull}\" from the question bank"	

	



