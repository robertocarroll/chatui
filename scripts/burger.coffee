# Description:
#   Find burger place
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Command: [not included in help script]
#   burger - find burger place
#
# Author:
#   robertocarroll

burger_places = [
    {
        "name": "Almost Famous",
        "cost": "7.5",
        "rating": "4",
        "minutes": "4",
        "distance": "0.2",
        "address": "High Street",
        "postcode": "M4 1HP",
        "latitude": "53.484476",
        "longitude": "-2.236841"
    },
    {
        "name": "Archies Burgers and Shakes",
        "cost": "-",
        "rating": "4",
        "minutes": "20",
        "distance": "1",
        "address": "Oxford Street",
        "postcode": "M1 5NH",
        "latitude": "53.474221",
        "longitude": "-2.241047"
    },
    {
        "name": "Byron",
        "cost": "6.75",
        "rating": "4",
        "minutes": "9",
        "distance": "0.5",
        "address": "Piccadilly Gardens",
        "postcode": "M1 1RG",
        "latitude": "53.480333",
        "longitude": "-2.236441"
    },
    {
        "name": "Burger and Lobster",
        "cost": "20",
        "rating": "4",
        "minutes": "10",
        "distance": "0.5",
        "address": "King Street",
        "postcode": "M2 4WU",
        "latitude": "53.480581",
        "longitude": "-2.242922"
    },
    {
        "name": "Dog Bowl",
        "cost": "7.50",
        "rating": "4",
        "minutes": "19",
        "distance": "1",
        "address": "Whitworth Street West",
        "postcode": "M1 5WW",
        "latitude": "53.473974",
        "longitude": "-2.243336"
    },
    {
        "name": "Dukes 92",
        "cost": "8.95",
        "rating": "4",
        "minutes": "24",
        "distance": "1.2",
        "address": "Castle Street",
        "postcode": "M3 4LZ",
        "latitude": "53.474435",
        "longitude": "-2.254759"
    },
    {
        "name": "Filthy Cow",
        "cost": "6",
        "rating": "-",
        "minutes": "10",
        "distance": "0.5",
        "address": "Tib Lane",
        "postcode": "M2 4JB",
        "latitude": "53.480362",
        "longitude": "-2.244578"
    },
    {
        "name": "Gourmet Burger Kitchen",
        "cost": "9.75",
        "rating": "3",
        "minutes": "15",
        "distance": "0.8",
        "address": "Spinningfields",
        "postcode": "M3 3ER",
        "latitude": "53.481341",
        "longitude": "-2.253384"
    },
    {
        "name": "Handmade Burger Company",
        "cost": "6.45",
        "rating": "4",
        "minutes": "14",
        "distance": "0.7",
        "address": "Deansgate",
        "postcode": "M3 3WB",
        "latitude": "53.479201",
        "longitude": "-2.249303"
    },
    {
        "name": "Hard Rock Cafe",
        "cost": "-",
        "rating": "4",
        "minutes": "2",
        "distance": "0.1",
        "address": "The Printworks",
        "postcode": "M4 2BS",
        "latitude": "53.485262",
        "longitude": "-2.240696"
    },
    {
        "name": "Red's True Barebecue",
        "cost": "8.95",
        "rating": "4",
        "minutes": "12",
        "distance": "0.6",
        "address": "Lloyd Street",
        "postcode": "M2 5WA",
        "latitude": "53.478955",
        "longitude": "-2.2468"
    },
    {
        "name": "Smoak Bar and Grill",
        "cost": "15.5",
        "rating": "3.5",
        "minutes": "7",
        "distance": "0.3",
        "address": "Malmaison Hotel",
        "postcode": "M1 1LZ",
        "latitude": "53.481876",
        "longitude": "-2.237911"
    },
    {
        "name": "Solita Bar and Grill",
        "cost": "9.5",
        "rating": "4",
        "minutes": "5",
        "distance": "0.2",
        "address": "Northern Quarter",
        "postcode": "M4 1DN",
        "latitude": "53.483559",
        "longitude": "-2.236851"
    },
    {
        "name": "TGI Fridays",
        "cost": "10",
        "rating": "3.5",
        "minutes": "6",
        "distance": "0.3",
        "address": "Cross Street",
        "postcode": "M2 7DH",
        "latitude": "53.481676",
        "longitude": "-2.244633"
    },
    {
        "name": "Tib Street Tavern",
        "cost": "6.95",
        "rating": "4",
        "minutes": "6",
        "distance": "0.3",
        "address": "74 Tib Street",
        "postcode": "M4 1LG",
        "latitude": "53.483725",
        "longitude": "-2.234621"
    }
]

shuffle = (a) ->
    i = a.length
    while --i > 0
        j = ~~(Math.random() * (i + 1))
        t = a[j]
        a[j] = a[i]
        a[i] = t
    a

module.exports = (robot) ->
	robot.hear /burger/i, (msg) ->
		random_burger_places = shuffle (burger_places)
		random_burger = random_burger_places[0]
		burger_name = random_burger.name 
		burger_cost = random_burger.cost 
		burger_address = random_burger.address
		burger_lat = random_burger.latitude
		burger_lon = random_burger.longitude 
		if random_burger.rating >= 5
			burger_rating = 'great'
		else if random_burger.rating >= 4
			burger_rating = 'good'
		else if random_burger.rating >= 3
			burger_rating = 'OK'
		else if random_burger.rating >= 2
			burger_rating = 'not bad'	
		else if random_burger.rating >= 1
			burger_rating = 'poor'		
		else
			burger_rating = 'not been rated'
		msg.send "Try #{burger_name} on #{burger_address}. It's #{burger_rating} and a burger costs £#{burger_cost}. Here's how to get there: https://www.google.com/maps?saddr=My+Location&daddr=#{burger_lat},#{burger_lon}"