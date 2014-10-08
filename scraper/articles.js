var scraper = require('./scraper.js'),
    fs = require("fs");

var articleData = [];

// **************************************************************************
// USE THE OUTPUT FROM TOPICS.JS TO GET THE BODY TEXT OF THE ARTICLES
// **************************************************************************
fs.readFile('data/topics.json', 'utf8', function (err, topicJSON) {
  var articleArray = [], articles = JSON.parse(topicJSON);

  articles.forEach(function(item, index) {
      articleArray.push({title: item.title, link: item.link, date: item.date});
  });
 
  // INVOKE THE STEP FUNCTION WITH FIRST FILM
   step(articleArray.shift(), articleArray);

 // console.log (articleArray[9].link);

});

function step(item, list) {
  if(item) {
    console.log("PROCESSING: ", item.link)
    scraper.scrapeArticle(item.link, function(result) {
    	result['title'] = item.title;
    	result['date'] = item.date;
    	result['link'] = item.link;
      articleData.push(result);
      return step(list.shift(), list);
    });
  } else {
    return scraper.writeFile('data/articles.json', articleData);
  }
}