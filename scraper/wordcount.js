fs = require("fs"),
	commaIt = require('comma-it');

fs.readFile('data/articles.json', 'utf8', function (err, topicJSON) {
  var articleArray = [], articles = JSON.parse(topicJSON);

  articles.forEach(function(item, index) {
      articleArray.push({title: item.title, date: item.date, link: item.link, article: item.article});      
  });

  var text = {};
  var arrayLength = articleArray.length
		for (var i=0; i<arrayLength; ++i) {

		// example here: http://stackoverflow.com/questions/750486/javascript-closure-inside-loops-simple-practical-example	

		(function(index) {
        var s = articleArray[i].article;				   
				text = s.toString();
				countWordsInText(text);
    })(i);

		}

		totalCount();

});

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

function totalCount () {
		var totalWords = 0;
		for (var key in wordCounts) {
		    totalWords += wordCounts[key];
		};

	var readingTime = Math.round(totalWords / 250);	
	totalWords = commaIt(totalWords, {precision: 0, thousandSeperator : ','});

	 console.log('The total number of words MEN have written about me is ' + totalWords 
	 	+ ' and the average reader would take ' + readingTime + ' minutes to read them' );

}	 







