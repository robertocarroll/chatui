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
#   scotch me e e e - supply a user with scotch
#
# Author:
#   fusion94


module.exports = (robot) ->
  robot.hear /hi|hello/i, (msg) ->
    msg.send "Hello. I'm Libby. I'm a robot that helps you find out interesting things about the Central Library in Manchester. I can show you stories from the Manchester Evening News and pictures from the archives. Please keep it simple - I'm learning"
