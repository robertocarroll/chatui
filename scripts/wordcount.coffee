# Description:
#   Wordcount for Central library topic page 
#
# Commands:
#   local news details - Details about Central library stories
#

module.exports = (robot) ->
  robot.hear /local news/i, (msg) ->
    msg.send "MEN has written 15,773 words about me in the last 7 months and a human would take about 63 minutes to read them all. The latest article was 15 days ago. The oldest article was 7 months ago."

					 