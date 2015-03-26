# Description:
#   Display rain
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Command: [not included in help script]
#   rain - is it going to rain in the next hour?
#
# Author:
#   robertocarroll

moment = require 'moment'

# Time
currentHour = null
greeting = null

getGreeting = (greeting) ->
	currentHour = moment().hour()
	if currentHour < 12
		greeting = 'Good morning'
	else if currentHour >= 12 && currentHour <= 17
		greeting = 'Good afternoon'
	else if currentHour > 17 && currentHour <= 24
		greeting = 'Good evening'
	else
		greeting = 'Hello'

# get the weather
currentWeather = ' '
exclude = 'hourly,daily,flags'
getWeather = (msg, cb) ->
	msg.http("https://api.forecast.io/forecast/#{process.env.HUBOT_DARK_SKY_API_KEY}/53.480759,-2.242631?exclude=#{exclude}") 
    	.get() (err, res, body) ->
    		try
    			result = JSON.parse(body)
    			if result['minutely']
    				dataPoints = result['minutely']['data'] || []
    				dataPointsWithPrecipitation = []
    				mostIntenseDataPoint = {}
    				mostProbableDataPoint = {}
    				now = new Date()

    				if dataPoints.length > 0
    					totalIntensity = 0
    					for dataPoint in dataPoints
    						intensity = dataPoint['precipIntensity'] || 0
    						probability = dataPoint['precipProbability'] || 0
    						totalIntensity += (dataPoint['precipIntensity'] || 0)

    						if totalIntensity == 0
				    			currentWeather = "Excellent! Looks like a dry hour from here."
				    		else 
				    			dataPointsWithPrecipitation.push(dataPoint)
				    			hightIntensity = mostIntenseDataPoint['precipIntensity'] || 0
				    			mostIntenseDataPoint = dataPoint if intensity > hightIntensity

				    			hightProbability = mostProbableDataPoint['precipProbability'] || 0
				    			mostProbableDataPoint = dataPoint if probability > hightProbability

				    			amountOfRain = dataPointsWithPrecipitation.length
				    			
				    			isAnomaly = false
				    			isAnomaly = true if amountOfRain < 5
				    			isAnomaly = true if mostIntenseDataPoint['precipProbability'] < 0.20
				    			isAnomaly = true if totalIntensity < (3 * mostIntenseDataPoint['precipIntensity'])

				    			if !isAnomaly
				    				intensity = mostIntenseDataPoint['precipIntensity']
				    				if intensity >= 0.4
				    					_intensity = 'heavy'
				    				else if intensity >= 0.1
				    					_intensity = 'moderate'
				    				else if intensity >= 0.02
				    					_intensity = 'light'
				    				else
				    					_intensity = 'very light'

				    				probability = mostProbableDataPoint['precipProbability']
				    				if probability >= 0.99
				    					_probability = 'definitely going'
				    				else if probability >= 0.90
				    					_probability = 'very likely'
				    				else if probability >= 0.66
				    					_probability = 'likely'
				    				else if probability >= 0.33
				    					_probability = 'likely as not'	
				    				else
				    					_probability = 'probably not going'

				    				timestamp = mostIntenseDataPoint['time']
				    				date = new Date(timestamp * 1000)
				    				delta = (date - now)
				    				mostIntenseFromNow = "#{Math.round(delta / 60 / 1000)}"

				    				currentWeather = "I think it's #{_probability} to rain in the next hour. It will probably be #{_intensity} rain in about #{mostIntenseFromNow} minutes."
				    			else 
				    				currentWeather = "Don't worry. I don't think it's going to rain in the next hour."
    		catch e
    			currentWeather = "Sorry, I can't get a forecast right now."
    		cb currentWeather

module.exports = (robot) ->
  robot.hear /rain/i, (msg) ->
  	getWeather msg, (currentWeather) ->
  		theGreeting = getGreeting(greeting)
  		msg.send theGreeting + '. ' + currentWeather
    



