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

module.exports = (robot) ->
	robot.brain.on 'loaded', =>
		robot.logger.info "Loading knowledge"
		robot.brain.data.questions ?= []

		robot.brain.data.questions = question_bank # unless robot.brain.data.questions.length
		current_question = null

		robot.hear /chat/i, (msg) ->
			# get the IDs of all the questions	
			question_id = (get_question.id for get_question in robot.brain.data.questions)
			robot.logger.info question_id
			# generate a random question ID  
			current_question = question_id[Math.floor(Math.random() * question_id.length)]
			robot.logger.info current_question
			# need to remove the current question id from the question_id so it isn't repeated 
			# question_id.filter (i) -> i is current_question
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
			msg.send current_question + ' '

		# Add a new question via Hubot 	
		robot.respond /question (.*)$/i, (msg) ->
			question_value = msg.match[1]
			next_id = robot.brain.data.questions.length    
			new_question = {id:next_id, question: question_value, answers: []}
			robot.brain.data.questions.push new_question
			msg.send "OK, I've added \"#{question_value}\" as a new question"

	



