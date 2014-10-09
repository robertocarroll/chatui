var request = require('request'),
    cheerio = require('cheerio'),
    fs = require("fs");

module.exports =  {

scrapeTopics: function (item, callback) {
    var rec = [];
    request(item, function (error, response, html) {
      if (!error) {

    var $ = cheerio.load(html);
    
    $('.article').each(function(i, element){
      
    	var raw = $(this);  
    	var title = $(raw).find('h2, h3');
    	title = title.text();
      title = title.trim(); 

      var date = $(raw).find('.tools .time');
    	date = date.text();
      date = date.trim(); 

      var link = $(raw).find('a').attr('href');
      
      var metadata = {
        title: title,
        date: date,
        link: link 
      };

      rec.push(metadata);
           
    });

        callback(rec);
      
      } else{
        console.log("HTML Load Error: " + error )
      }
    });
  },scrapeArticle: function (item, callback) {
    var rec = {};
    request(item, function (error, response, html) {
      if (!error) {
        var $ = cheerio.load(html);
        rec['article'] = cleanText($('.body').text());
        callback(rec);
      } else{
        console.log("HTML LOAD Error: " + error )
      }
    });
  },
  writeFile: function (path, data) {
    fs.writeFile(path, JSON.stringify(data, null, 4), function(err) {
      if(err) {
        console.log("File Save Error: " + err); 
      } else {
        console.log(path + " saved");
      }
    });
  }
}

function cleanText(text) {
  return text.replace(/_/g, " ")
             .replace(/^dbpedia:/, "")
             .replace(/^ /, "")
             .replace(/\(.*\)/, "")
             .replace(/ $/, "");
}

function getSet($, selector, callback) {
  var set = [];
  $(selector).each(function(){
    set.push({label: cleanText(this.text()), name: this.text(), link: this.attr('href')});
  });
 callback(set);
}

