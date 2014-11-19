# Exploring how to make Manchester Evening News part of the fabric of the city.

## Aims / Guides
- Serve relevant information from a wide range of sources in playful, witty and engaging ways
- Encourage sharing / encounters in the city
- Encourage people to interact with and use the city in exciting ways 
- Encourage participation and engagement in public spaces
- Be useful. Provide value
- Don't replicate other apps and services
- Explore location and its relationship with information and memory
- Not personal but personal to place
- Provide the smartest, most relevant material in any given context

## Principles / Thoughts
- The user path has to be short
- The bot is the "verb"
- Conversational UI is v fragile - How to make the user aware of what the bot can do.
- Gentle, human, considered
- Playful and witty
- Small pieces loosely joined - use existing infrastructure and apps
- Front-load experience. First interaction has to be really good
- Always try to keep the conversation going

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





