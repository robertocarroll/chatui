var scraper = require('./scraper.js');

var topicData = [];

var topics = [
  'http://www.manchestereveningnews.co.uk/all-about/manchester-central-reference-library'];

// **************************************************************************
// SCRAPE ARTICLES FROM TOPIC PAGES LISTED ABOVE - ITEMS SCRAPED IN PARALLEL
// **************************************************************************
topics.forEach(function(item) {
  scraper.scrapeTopics(item, function(result){
    console.log("Processing: ", item)
    topicData.push(result);
    if(topicData.length == topics.length) {
      scraper.writeFile('topics.json', topicData);
    }
  })
});
