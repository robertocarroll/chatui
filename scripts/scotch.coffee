# Description:
#   Display a random image of Scotch
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   scotch me - supply a user with scotch
#
# Author:
#   fusion94


module.exports = (robot) ->
  robot.respond /hi|hello/i, (msg) ->
    msg.send "Howdy!"
