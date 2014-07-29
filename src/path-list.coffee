module.exports = (a) ->
  alpha = []
  n = a.length
  for i in [0...n]
    for j in [0...n]
      if a[i][j] isnt 0
        alpha.push [i, j, a[i][j]]
  alpha
