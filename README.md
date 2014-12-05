# How to make Manchester Evening News part of the fabric of the city.
Exploring what lies between the physical newspaper and the digital web/app. What are the physical manifestations of news in a city? The project targets the *mobile* audience and the *local* audience.  
## Scenario
I have arrived at the Central Library in Manchester. I am meeting a friend at the cafe and I have a few minutes to spare. I see the sign about having a conversation with building itself. Intrigued I pull out my phone and text "Hello" to the number. 

## Structure 
- Each bot is grounded in a particular place. Speaks in first person. Opportunity to explore character/personality.
- Central Libary is the exemplar. Other possible locations include town hall, Picadilly Gardens, postbox in Arndale centre, train stations, cafes, art galleries, parks and other public spaces. 

## Value
![Diagram of possible uses of MEN project](https://farm8.staticflickr.com/7485/15662826668_23c1ee4ea3_c.jpg)

## Aims / Guides
- Serve relevant information from a wide range of sources in playful, witty and engaging ways
- Encourage sharing / encounters in the city
- Encourage people to interact with and use the city in exciting ways 
- Encourage participation and engagement in public spaces
- Be useful. Provide *value*
- Don't replicate other apps and services
- Explore location and its relationship with information and memory
- Not personal but personal to place
- Provide the smartest, most relevant material in any given context

## Principles / Thoughts
- The user path has to be short
- The bot is the "verb"
- Conversational UI is v fragile - How to make the user aware of what the bot can do?
- Gentle, human, considered
- Playful and witty
- Small pieces loosely joined - use existing infrastructure and apps
- Front-load experience. First interaction has to be really good
- Always try to keep the conversation going

### Phase 2 update (28 November 2014)
During the process of building this project, the targeted and specific nature of the tasks seems to be vital over general commands, e.g. instead of "latest news" get latest news about the Central Library or instead of "weather" tell me if it is going to rain in an hour. 

We have to do the work so the user does not have to.  

## Hubot 
Need Redis running to run Hubot locally:
redis-server /usr/local/etc/redis.conf

To launch:
bin/hubot

## Commands
1. "hello" - 
2. "latest news" - 
3. "local news" - 
4. "weather" - 
5. "old image" / "old picture" - 

## Scraper
1. Topics.js goes and gets the title, date and url from an MEN topic page.
2. Articles.js uses the result of topics.js to get the body text for each article.
3. Wordcount.js counts the words in these articles - calculates the total words and reading time. 

## Hubot / Twilio adapter 
- The [Twilio adapter](https://github.com/jkarmel/hubot-twilio) listed on the [Hubot adapters page](https://github.com/github/hubot/blob/master/docs/adapters.md) does not seem to work.
- This [forked version](https://github.com/Queens-Hacks/hubot-twilio) works.
- In Hubot package.json add to dependencies: 

<code>"hubot-twilio": "Queens-Hacks/hubot-twilio"</code>





