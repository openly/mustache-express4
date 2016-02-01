Mustache = require 'mustache'
fs = require 'fs'
path = require 'path'

loadPartials = (dir)->
  conts = fs.readdirSync dir
  retval = {}
  for file in conts
    continue unless /\.mustache$/.test(file)
    partialName = file.replace /\.mustache$/, ''
    retval[partialName] = fs.readFileSync(path.join(dir,"#{partialName}.mustache")).toString()
  return retval

module.exports = render = (viewFile, args, callback)->
  return fs.readFile viewFile, (e, cont)->
    return callback(e, Mustache.render(cont.toString(), args, loadPartials(args.settings.partials)))