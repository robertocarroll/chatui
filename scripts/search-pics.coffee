# Description:
#   Hubot searches the Manchester image archives
#
# Dependencies:
#   None
#
# Configuration:
#   None
#  images = $("div.cont.group img").toArray()
#      image = images[Math.floor(Math.random()*images.length)]
#      msg.send $(image).attr("src") if image
# Commands:
#   hubot pics <query> - Search the Manchester image archives
#
# Author:
#   robertocarroll

request = require 'request'
cheerio = require 'cheerio'
url = "http://images.manchester.gov.uk/ResultsList.php?QueryName=BasicQuery&QueryPage=%2Findex.php&Restriction=&StartAt=1&Anywhere=SummaryData|AdmWebMetadata&QueryTerms="

module.exports = (robot) ->
 robot.respond /pics?(?: me)? (.*)/i, (msg) ->
    q = escape(msg.match[1])
    request "#{url}#{q}#&QueryOption=Anywhere&Submit=Search", (error, response, body)->
      throw error if error
      $ = cheerio.load(body)
      msg.send $

