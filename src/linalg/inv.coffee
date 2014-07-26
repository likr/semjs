solve = require './solve'

module.exports = (a) ->
  n = a.length
  a_inv = ((0 for j in [0...n]) for i in [0...n])
  for i in [0...n]
    b = (0 for j in [0...n])
    b[i] = 1
    x = solve a, b
    for j in [0...n]
      a_inv[j][i] = x[j]
  a_inv
