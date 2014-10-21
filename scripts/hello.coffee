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


module.exports = (robot) ->
  robot.hear /hi|hello/i, (msg) ->
    msg.send "Hello. I'm Libby. I'm a robot that helps you find out interesting things about the Central Library in Manchester. I can show you stories from the Manchester Evening News ('latest news'), pictures of me from the archives ('old images', tell you the weather ('weather'). Please keep it simple - I'm learning"
