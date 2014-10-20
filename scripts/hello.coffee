# Description:
#   Says hello
#
# Commands:
#   hello - responds with a greeting

greetings = [
  "Hello. I'm Libby. I'm a robot that helps you find out interesting things about the Central Library in Manchester. I can show you stories from the Manchester Evening News and pictures from the archives. Please keep it simple - I'm learning."
  ]

module.exports = (robot) ->
  robot.hear /hello/i, (msg) ->
    msg.send greetings