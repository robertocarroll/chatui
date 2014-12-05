# Description:
#   Wordcount for Central library topic page 
#
# Commands:
#   local news - Details about Central library stories
#

module.exports = (robot) ->
  robot.hear /local news/i, (msg) ->
    msg.send "MEN has written 15,626 words about me in the last 7 months and a human would take about 63 minutes to read them. That's like reading The Communist Manifesto (11,772 words) which Marx and Engels worked on at the nearby Chetham's library in the 1840s. The latest article was 2 days ago. The oldest article was 7 months ago."

					 