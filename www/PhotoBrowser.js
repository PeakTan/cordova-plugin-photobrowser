var exec = require('cordova/exec');

exports.show = function (urls, index) {
    exec(function(){}, function(){}, 'PhotoBrowser', 'show', [urls, index]);
};