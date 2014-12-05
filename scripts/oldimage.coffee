# Description:
#   Display a random image of the Central library from http://images.manchester.gov.uk
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Command:
#   old image - Display a random image of the Central library from http://images.manchester.gov.uk
#
# Author:
#   robertocarroll

oldImage = [
 "http://images.manchester.gov.uk/web/objects/common/webmedia.php?irn=47834&size=190x157&format=jpg",
"http://images.manchester.gov.uk/web/objects/common/webmedia.php?irn=78097&size=190x157&format=jpg",
"http://images.manchester.gov.uk/web/objects/common/webmedia.php?irn=79027&size=190x157&format=jpg",
"http://images.manchester.gov.uk/web/objects/common/webmedia.php?irn=49227&size=190x157&format=jpg",
"http://images.manchester.gov.uk/web/objects/common/webmedia.php?irn=48640&size=190x157&format=jpg",
"http://images.manchester.gov.uk/web/objects/common/webmedia.php?irn=48639&size=190x157&format=jpg",
"http://images.manchester.gov.uk/web/objects/common/webmedia.php?irn=47909&size=190x157&format=jpg",
"http://images.manchester.gov.uk/web/objects/common/webmedia.php?irn=5447&size=190x157&format=jpg",
"http://images.manchester.gov.uk/web/objects/common/webmedia.php?irn=78031&size=190x157&format=jpg"
]

module.exports = (robot) ->
  robot.hear /old image|old picture/i, (msg) ->
    msg.send msg.random oldImage 
