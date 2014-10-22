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
    msg.send "Hello. I'm Libby. I'm a robot that helps you find out interesting things about the Central Library in Manchester. I can show you the latest stories from the Manchester Evening News ('latest news'), tell you stories from Manchester Evening News about me ('local news'), find pictures of me from the archives ('old image') and tell you the weather ('weather'). Please keep it simple - I'm learning"
