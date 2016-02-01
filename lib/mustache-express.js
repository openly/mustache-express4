var Mustache, fs, loadPartials, path, render;

Mustache = require('mustache');

fs = require('fs');

path = require('path');

loadPartials = function(dir) {
  var conts, file, i, len, partialName, retval;
  conts = fs.readdirSync(dir);
  retval = {};
  for (i = 0, len = conts.length; i < len; i++) {
    file = conts[i];
    if (!/\.mustache$/.test(file)) {
      continue;
    }
    partialName = file.replace(/\.mustache$/, '');
    retval[partialName] = fs.readFileSync(path.join(dir, partialName + ".mustache")).toString();
  }
  return retval;
};

module.exports = render = function(viewFile, args, callback) {
  return fs.readFile(viewFile, function(e, cont) {
    return callback(e, Mustache.render(cont.toString(), args, loadPartials(args.settings.partials)));
  });
};
