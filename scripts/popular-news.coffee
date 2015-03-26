# Description:
#   Get most popular story from MEN
#   See also https://github.com/github/hubot-scripts/blob/master/src/scripts/chartbeat.coffee
#
# Dependencies:
#   None
#
# Configuration:
# 	HUBOT_CHARTBEAT_API_KEY 
#
# Command: [not included in help script]
#   election - find election candidates
#
# Author:
#   robertocarroll

getChart = (msg, apiKey) ->
	msg.robot.http("http://api.chartbeat.com/live/toppages/v3/?apikey=#{apiKey}&host=manchestereveningnews.co.uk&section=greater-manchester-news&sort_by=social&types=1")
		.get() (err, res, body) ->
			unless res.statusCode is 200
				msg.send "Sorry there was a problem with Chartbeat. I couldn't get a story right now."
				return

			response = JSON.parse(body)	
			popular = response.pages || []
			popular_article = popular[0].title.substring(0,48)+"[...]"
			popular_article_link = popular[0].path
			msg.send "I bring you the hottest story right now: #{popular_article}. http://#{popular_article_link}"

module.exports = (robot) ->
	robot.hear /popular/i, (msg) ->
		apiKey = process.env.HUBOT_CHARTBEAT_API_KEY
		getChart(msg, apiKey)