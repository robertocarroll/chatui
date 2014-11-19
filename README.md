Exploration of conversational UI

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
6. 

## Scraper
1. Topics.js goes and gets the title, date and url from an MEN topic page.
2. Articles.js uses the result of topics.js to get the body text for each article.
3. Wordcount.js counts the words in these articles - calculates the total words and reading time. 

## Hubot / Twilio adapter 
- The [Twilio adapter](https://github.com/jkarmel/hubot-twilio) listed on the [Hubot adapters page](https://github.com/github/hubot/blob/master/docs/adapters.md) does not seem to work.
- This [forked version](https://github.com/Queens-Hacks/hubot-twilio) works.
- In Hubot package.json add to dependencies: 

<code>"hubot-twilio": "Queens-Hacks/hubot-twilio"</code>





