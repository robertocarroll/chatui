Exploration of conversational UI

##Hubot 
Need Redis running to run Hubot locally:
redis-server /usr/local/etc/redis.conf

To launch:
bin/hubot

##Scraper
1. Topics.js goes and gets the title, date and url from an MEN topic page.
2. Articles.js uses the result of topics.js to get the body text for each article.
3. Wordcount.js counts the words in these articles - calculates the total words and reading time. 





