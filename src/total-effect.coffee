inv = require './linalg/inv'

module.exports = (a) ->
  n = a.length
  t_inv = for i in [0...n]
    for j in [0...n]
      if i is j
        1 - a[i][j]
      else
        -a[i][j]
  inv t_inv
