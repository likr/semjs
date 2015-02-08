$ = require 'jquery'

module.exports = ->
  url = 'http://hyperinfo.viz.media.kyoto-u.ac.jp/wsgi/websem'

  solver = (n, alpha, sigma, s) ->
    $.ajax
      type: 'POST'
      url: url + '/sem'
      data: JSON.stringify
        n: n
        alpha: alpha
        sigma: sigma
        S: s
      contentType: 'application/json'

  solver.solve = (n, alpha, sigma, s) ->
    solver(n, alpha, sigma, s)

  solver.url = () ->
    if arguments.length is 0
      url
    else
      url = arguments[0]
      solver

  solver
