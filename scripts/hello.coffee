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

# get current time
weather = 

module.exports = (robot) ->
  robot.hear /hi|hello/i, (msg) ->
  	# Time
  	if currentHour < 12
      greeting = 'Good morning'
    if currentHour >= 12 && currentHour <= 17
      greeting = 'Good afternoon'
    if currentHour > 17 && currentHour <= 24
      greeting = 'Good evening'     
  	msg.send greeting 
