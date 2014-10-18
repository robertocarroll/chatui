# Description:
#   Greeting
# Commands:
#   hubot hello - Introduction
#I'm Horatio. I'm a robot that helps you find out interesting things about the Central Library in Manchester. I can show you stories from the Manchester Evening News and pictures from the archives. Please keep it simple - I'm learning.
# Notes:
#   

greetings = [
  "Hello."
  ]

module.exports = (robot) ->
  robot.hear /hello/i, (msg) ->
    msg.send greetings