module.exports = (a) ->
  n = a.length
  lu = a.map (row) -> row.map (x) -> x
  for k in [0...n]
    u = lu[k][k]
    for i in [k + 1...n]
      t = (lu[i][k] /= u)
      for j in [k + 1...n]
        lu[i][j] -= t * lu[k][j]
  lu
