// Generated by CoffeeScript 1.8.0
module.exports = function(robot) {
  return robot.hear(/hi|hello/i, function(msg) {
    return msg.send("Howdy!");
  });
};
