fs = require("fs"),
	commaIt = require('comma-it'),
	moment = require('moment');

var articleArray = [];	
var datesArray = [];

fs.readFile('data/articles.json', 'utf8', function (err, topicJSON) {
  var articles = JSON.parse(topicJSON);

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

				datesArray.push(new Date(moment(articleArray[i].date, "DD-MM-YYYY")));

    })(i);

		}
		
		getDate();

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

function getDate () {

	var maxDate = moment(new Date(Math.max.apply(null,datesArray)));
  var minDate = moment(new Date(Math.min.apply(null,datesArray)));

	minDate = minDate.fromNow(true);
	maxDate = maxDate.fromNow(true);

	totalCount (minDate, maxDate);
		
}

function totalCount (minDate, maxDate) {
		var totalWords = 0;
		for (var key in wordCounts) {
		    totalWords += wordCounts[key];
		};

	var readingTime = Math.round(totalWords / 250);	
	totalWords = commaIt(totalWords, {precision: 0, thousandSeperator : ','});

	var stream = fs.createWriteStream("data/results.txt");
		stream.once('open', function(fd) {
		  stream.write('MEN has written ' + totalWords 
	 	+ ' words about me in the last ' + minDate + ' and a human would take about ' + readingTime + ' minutes to read them all. ');
		  stream.write('The latest article was '+maxDate + ' ago. ');
		  stream.write('The oldest article was '+minDate + ' ago.');
		  stream.end();
		});

}	 







