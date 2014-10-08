fs = require("fs");
var wordCounts = Object.create(null);

function countWordsInText(text) {
    var words = text
        .toString()
        .toLowerCase()
        .split(/\W+/)
        .sort();

    for (var index in words) {
        var word = words[index];
        if (word) {
            wordCounts[word] = (wordCounts[word]) ? wordCounts[word] + 1 : 1;
        }
    }
}

fs.readFile('articles.json', 'utf8', function (err, topicJSON) {
  var articleArray = [], articles = JSON.parse(topicJSON);

  articles.forEach(function(item, index) {
      articleArray.push({article: item.article});
  });

  var text = articleArray[9].article;
 
	countWordsInText(text);
 console.log (wordCounts);

});

