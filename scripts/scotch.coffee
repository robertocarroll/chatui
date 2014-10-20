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
  "hello1"
]

module.exports = (robot) ->
  robot.hear /hello ?me/i, (msg) ->
    msg.send msg scotch 
