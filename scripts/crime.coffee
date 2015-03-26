# Description:
#   Display crime stats
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Command: [not included in help script]
#   crime - 
#
# Author:
#   robertocarroll

population = 20206 

crime_name = [{"url":"all-crime","name":"All crime"},{"url":"anti-social-behaviour","name":"Anti-social behaviour"},{"url":"bicycle-theft","name":"Bicycle theft"},{"url":"burglary","name":"Burglary"},{"url":"criminal-damage-arson","name":"Criminal damage and arson"},{"url":"drugs","name":"Drugs"},{"url":"other-theft","name":"Other theft"},{"url":"possession-of-weapons","name":"Possession of weapons"},{"url":"public-order","name":"Public order"},{"url":"robbery","name":"Robbery"},{"url":"shoplifting","name":"Shoplifting"},{"url":"theft-from-the-person","name":"Theft from the person"},{"url":"vehicle-crime","name":"Vehicle crime"},{"url":"violent-crime","name":"Violence and sexual offences"},{"url":"other-crime","name":"Other crime"}]

crimes = [{"Date":"2014-12","ASB":434,"Burglary":46,"Robbery":35,"Vehicle":57,"Violent":232,"Drugs":30,"CD&A":48,"Shoplifting":198,"Bike Theft":28,"Theft From the Person":251,"Other Theft":279,"Weapons":2,"Public Order":57,"Other":9,"Total":1706},
{"Date":"2014-11","ASB":506,"Burglary":45,"Robbery":32,"Vehicle":42,"Violent":228,"Drugs":71,"CD&A":50,"Shoplifting":154,"Bike Theft":38,"Theft From the Person":270,"Other Theft":213,"Weapons":3,"Public Order":51,"Other":7,"Total":1710},
{"Date":"2014-10","ASB":528,"Burglary":62,"Robbery":38,"Vehicle":47,"Violent":180,"Drugs":37,"CD&A":56,"Shoplifting":153,"Bike Theft":54,"Theft From the Person":194,"Other Theft":209,"Weapons":6,"Public Order":45,"Other":8,"Total":1617},
{"Date":"2014-09","ASB":495,"Burglary":40,"Robbery":49,"Vehicle":40,"Violent":150,"Drugs":32,"CD&A":32,"Shoplifting":155,"Bike Theft":55,"Theft From the Person":194,"Other Theft":178,"Weapons":7,"Public Order":43,"Other":6,"Total":1476},
{"Date":"2014-08","ASB":562,"Burglary":67,"Robbery":33,"Vehicle":48,"Violent":173,"Drugs":38,"CD&A":45,"Shoplifting":163,"Bike Theft":49,"Theft From the Person":195,"Other Theft":185,"Weapons":8,"Public Order":47,"Other":8,"Total":1621},
{"Date":"2014-07","ASB":495,"Burglary":55,"Robbery":24,"Vehicle":59,"Violent":164,"Drugs":34,"CD&A":56,"Shoplifting":138,"Bike Theft":36,"Theft From the Person":119,"Other Theft":206,"Weapons":7,"Public Order":46,"Other":8,"Total":1447},
{"Date":"2014-06","ASB":477,"Burglary":41,"Robbery":16,"Vehicle":32,"Violent":130,"Drugs":27,"CD&A":36,"Shoplifting":133,"Bike Theft":42,"Theft From the Person":98,"Other Theft":171,"Weapons":4,"Public Order":30,"Other":4,"Total":1241},
{"Date":"2014-05","ASB":429,"Burglary":40,"Robbery":27,"Vehicle":48,"Violent":162,"Drugs":30,"CD&A":55,"Shoplifting":137,"Bike Theft":33,"Theft From the Person":112,"Other Theft":180,"Weapons":3,"Public Order":41,"Other":5,"Total":1302},
{"Date":"2014-04","ASB":412,"Burglary":55,"Robbery":18,"Vehicle":45,"Violent":160,"Drugs":37,"CD&A":59,"Shoplifting":144,"Bike Theft":39,"Theft From the Person":119,"Other Theft":186,"Weapons":3,"Public Order":32,"Other":6,"Total":1315},
{"Date":"2014-03","ASB":486,"Burglary":54,"Robbery":26,"Vehicle":37,"Violent":141,"Drugs":56,"CD&A":61,"Shoplifting":147,"Bike Theft":33,"Theft From the Person":126,"Other Theft":168,"Weapons":2,"Public Order":34,"Other":14,"Total":1385},
{"Date":"2014-02","ASB":435,"Burglary":51,"Robbery":23,"Vehicle":44,"Violent":163,"Drugs":27,"CD&A":39,"Shoplifting":129,"Bike Theft":35,"Theft From the Person":152,"Other Theft":194,"Weapons":5,"Public Order":38,"Other":6,"Total":1341},
{"Date":"2014-01","ASB":441,"Burglary":54,"Robbery":23,"Vehicle":43,"Violent":115,"Drugs":49,"CD&A":41,"Shoplifting":146,"Bike Theft":22,"Theft From the Person":147,"Other Theft":179,"Weapons":1,"Public Order":26,"Other":3,"Total":1290}]

crime_ranking = [
    {
        "Rank": "1",
        "Neighbourhood": "Didsbury",
        "Total": "514",
        "Rate": "7.27"
    },
    {
        "Rank": "2",
        "Neighbourhood": "Fallowfield",
        "Total": "613",
        "Rate": "8.35"
    },
    {
        "Rank": "3",
        "Neighbourhood": "Salford East",
        "Total": "891",
        "Rate": "10.08"
    },
    {
        "Rank": "4",
        "Neighbourhood": "Stockport North",
        "Total": "735",
        "Rate": "10.47"
    },
    {
        "Rank": "5",
        "Neighbourhood": "Manchester North",
        "Total": "1141",
        "Rate": "11.42"
    },
    {
        "Rank": "6",
        "Neighbourhood": "Manchester East",
        "Total": "938",
        "Rate": "11.89"
    },
    {
        "Rank": "7",
        "Neighbourhood": "Longsight",
        "Total": "1112",
        "Rate": "12.96"
    },
    {
        "Rank": "8",
        "Neighbourhood": "Manchester City",
        "Total": "1706",
        "Rate": "84.43"
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

getCrime = (msg, cb) ->
	msg.http("http://data.police.uk/api/outcomes-at-location?date=2014-12&lat=53.4795&lng=-2.24003") 
		.get() (err, res, body) ->
			try
				result = JSON.parse(body)
				all_crimes = shuffle (result)
				current_crime = all_crimes[0]
				crime = current_crime.crime.category
				status = current_crime.category.name
				street = current_crime.crime.location.street.name
				find = (i for i in crime_name when i.url is crime)[0]
				full_crime = find.name.toLowerCase()
				currentCrime = "#{street} I believe there was a #{full_crime} incident. #{status}."
			catch e
				currentCrime = "Sorry, I can't get a crime at the moment."
			cb currentCrime		

module.exports = (robot) ->
  robot.hear /(\W|^)random\s{0,3}crime(\W|$)/i, (msg) ->
  	getCrime msg, (currentCrime) ->
  		msg.send currentCrime

  robot.hear /safe/i, (msg) ->
  	rateCrimes = 0
  	crimeCompare = null
  	regionNumber = crime_ranking.length
  	for crime in crime_ranking
  		rateCrimes += (Math.round(crime['Rate']) || 0)
  	averageCrimeRate = 	rateCrimes/regionNumber
  	find = (i for i in crime_ranking when i.Neighbourhood is 'Manchester City')[0] 
  	crimeRate = find.Rate
  	if crimeRate > averageCrimeRate
  		crimeCompare = 'higher than'
  	else if crimeRate < averageCrimeRate
  		crimeCompare = 'lower than'
  	else crimeCompare = 'the same as'
  	safeVerdict = "Be careful. The crime rate of #{crimeRate} is #{crimeCompare} the local average of #{averageCrimeRate}."
  	msg.send safeVerdict