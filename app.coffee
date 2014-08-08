app = require('express')();

app.engine 'mustache', require './lib/mustache-express'

app.set 'view engine', 'mustache'
app.set 'partials', __dirname + '/views/partials'

app.get '/', (req,res,next)->
  res.render 'index', {"somekey": "Some Value","title","abhi"}

app.listen 3000