cov = require './cov'

module.exports = (x) ->
  n = x.length
  sigma = cov x
  r = ((0 for j in [0...n]) for i in [0...n])
  for i in [0...n]
    r[i][i] = 1
    for j in [i + 1...n]
      r[j][i] = r[i][j] = sigma[i][j] / Math.sqrt(sigma[i][i] * sigma[j][j])
  r
