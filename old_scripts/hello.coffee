# Description:
#   Display hello
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Command: [not included in help script]
#   hi / hello - Replies with a greeting
#
# Author:
#   robertocarroll

moment = require 'moment'

# default greeting
greeting = 'Hello'

# get the weather
currentWeather = ' '
getWeather = (msg, cb) ->
	msg.http("https://api.forecast.io/forecast/#{process.env.HUBOT_DARK_SKY_API_KEY}/53.480759,-2.242631/") 
    	.get() (err, res, body) ->
    		try
    			result = JSON.parse(body)
    			fahrenheit = result.currently.apparentTemperature
    			celsius = (fahrenheit - 32) * (5 / 9)
    			weatherSummary = result.currently.icon
    			rainProb = result.currently.precipIntensity
    			# see here for details https://developer.forecast.io/docs/v2#forecast_call
    			currentWeather = " "
    			if celsius < 7 then currentWeather = "It's a bit chilly today. "
    			if rainProb >= 0.1 then currentWeather = "Looks like rain. "
    			if weatherSummary = 'clear-day' then currentWeather = "What a nice day. "
    			if weatherSummary = 'partly-cloudy-day' or 'cloudy' then currentWeather = "It's a bit dreary. "
    			# else if currentHour - result.currently.sunsetTime <= 1 then currentWeather = "It's nearly dark. "
    		catch e
    			currentWeather = ' '
    		cb currentWeather

# Varied greeting
pleasantry = [
	"It's lovely to hear from you. ",
	"Thanks for waking me up. ",
	"It's been a while since someone's talked to me. "
]

chatEnding = [
	"How can I help? Type 'talk' for a conversation or 'detail' to find out more about me."
]

module.exports = (robot) ->
  robot.hear /hello/i, (msg) ->
    # Time
    currentHour = moment().hour()
    if currentHour < 12
      greeting = 'Good morning'
    if currentHour >= 12 && currentHour <= 17
      greeting = 'Good afternoon'
    if currentHour > 17 && currentHour <= 24
      greeting = 'Good evening'

    # Weather  
    getWeather msg, (currentWeather) ->  
    	msg.send greeting + '. ' + currentWeather + [msg.random pleasantry] + chatEnding
    



