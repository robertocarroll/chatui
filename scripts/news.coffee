# Description:
#   Display latest news story from MEN
#
# Dependencies:
#   "request": "2.14.x",
#   "feedparser": "0.16.x",
#   "html-entities": "1.0.x"
#
# Configuration:
#   None
#
# Commands:
#   news / latest news
#
# Author:
#   robertocarroll

FeedParser = require('feedparser')
request = require('request')

getTheArticle = (callback) ->
  feedparser = new FeedParser()

  req = request(
    url: 'http://www.manchestereveningnews.co.uk/?service=rss'

    headers:
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.107 Safari/537.36'
  )

  req.on('error', (error) ->
    callback("Something bad happened with the request. #fufielding. #{error}")
  )

  req.on('response', (res) ->
    return callback("bad response code - #{res.statusCode}") unless res.statusCode == 200
    @pipe(feedparser)
  )

  feedparser.on('error', (error) ->
    callback("Feedparser error - #{error}")
  )

  feedparser.on('readable', ->
	  while item = @read()
	  	for line in item.title.split(/<br *\/>/)
        callback(line, item.link)
  )

module.exports = (robot) ->
  robot.hear /news ?/i, (msg) ->
    gotItThanks = false

    getTheArticle (article, theLink) ->
      msg.send "Hot off the press comes #{article}. It's x old. Read all about it here: #{theLink}" unless gotItThanks
      gotItThanks = true