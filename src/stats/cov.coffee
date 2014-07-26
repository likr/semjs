module.exports = (x) ->
  n = x.length
  m = x[0].length
  x_bar = x.map (xi) -> (xi.reduce (a, b) -> a + b) / m
  sigma = ((0 for j in [0...n]) for i in [0...n])
  for i in [0...n]
    for j in [i...n]
      for k in [0...m]
        sigma[i][j] += (x[i][k] - x_bar[i]) * (x[j][k] - x_bar[j])
      sigma[i][j] /= m
      sigma[j][i] = sigma[i][j]
  sigma
