# Description:
#   Display hello
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hi / hello - Replies with a greeting
#
# Author:
#   robertocarroll

moment = require 'moment'

# get current time
currentHour = moment().hour()
greeting = 'hello'

# get the weather
currentWeather = ' '
getWeather = (msg, cb) ->
	msg.http("https://api.forecast.io/forecast/#{process.env.HUBOT_DARK_SKY_API_KEY}/53.480759,-2.242631/") 
    	.get() (err, res, body) ->
    		try
    			result = JSON.parse(body)
    			currentWeather = result.currently.summary
    		catch e
    			currentWeather = ' '
    		cb currentWeather


module.exports = (robot) ->
  robot.hear /hi|hello/i, (msg) ->
    # Time
    if currentHour < 12
      greeting = 'Good morning'
    if currentHour >= 12 && currentHour <= 17
      greeting = 'Good afternoon'
    if currentHour > 17 && currentHour <= 24
      greeting = 'Good evening'
    getWeather msg, (currentWeather) ->  
    	msg.send greeting + currentWeather
    



