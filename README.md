mustache-express4
=================

Mustache rendering engine for express4.

Usage
-----
Use like any other view engine.
'''
app.engine 'mustache', require 'mustache-express4'
app.set 'view engine', 'mustache'
app.set 'partials', __dirname + '/views/partials'
'''
