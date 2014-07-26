module.exports = (a) ->
  n = a.length
  lu = [0...n].map () -> new Array(n)
  for k in [0...n]
    u = a[k][k]
    for i in [k + 1...n]
      t = (a[i][k] /= u)
      for j in [k + 1...n]
        a[i][j] -= t * a[k][j]
  a
