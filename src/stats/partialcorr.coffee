corrcoef = require './corrcoef'
inv = require '../linalg/inv'

module.exports = (x) ->
  n = x.length
  r = corrcoef x
  r_inv = inv r
  r_rest = for i in [0...n]
    for j in [0...n]
      r_inv[i][j] / Math.sqrt(r_inv[i][i] * r_inv[j][j])

