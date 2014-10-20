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

scotch = [
  "hello1",
  "hello2"
]

module.exports = (robot) ->
  robot.hear /scotch ?me/i, (msg) ->
    msg.send msg.random scotch 
