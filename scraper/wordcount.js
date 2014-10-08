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

   var text = {};
  var arrayLength = articleArray.length
		for (var i=0; i<arrayLength; ++i) {
		  if (i in articleArray) {
		    var s = articleArray[i].article;				   
				text = s.toString();
				countWordsInText(text);

		  }
		}

	var summed = 0;
		
		for (var key in wordCounts) {
		    summed += wordCounts[key];
		};

	 console.log(summed);

});


