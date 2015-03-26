# Description:
#   Find election candidates
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Command: [not included in help script]
#   vote - find election candidates
#
# Author:
#   robertocarroll

shuffle = (a) ->
    i = a.length
    while --i > 0
        j = ~~(Math.random() * (i + 1))
        t = a[j]
        a[j] = a[i]
        a[i] = t
    a

module.exports = (robot) ->
	robot.hear /vote/i, (msg) ->
		msg.http('http://yournextmp.popit.mysociety.org/api/v0.1/posts/66048?embed=membership.person')
		.get() (error, response, body) ->
			try
		  	candidate_data = JSON.parse(body)
		  	all_members = []
		  	all_members = candidate_data.result.memberships
		  	all_members2015 = []
			  for element, index in all_members
			  	if all_members[index].person_id.standing_in['2015']
			  		if all_members[index].person_id.standing_in['2015'].post_id == '66048'
			  			all_members2015.push all_members[index].person_id
			  	random_all_members2015 = shuffle (all_members2015)	
			  	random_member = random_all_members2015[0]
					msg.send random_member.name + " is standing for the " + random_member.party_memberships['2015'].name.substring(0,48) + ": " + random_member.html_url
			catch error
				msg.send "Sorry I can't find any details right now."
           