lu_decomposition = require './lu_decomposition'

module.exports = (a, b) ->
  n = a.length
  lu = lu_decomposition a
  y = b[..]
  for i in [0...n]
    for j in [0...i]
      y[i] -= lu[i][j] * y[j]
  x = y[..]
  for i in [n - 1..0]
    for j in [i + 1...n]
      x[i] -= lu[i][j] * x[j]
    x[i] /= lu[i][i]
  x
