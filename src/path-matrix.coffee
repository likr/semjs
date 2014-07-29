module.exports = (n, alpha) ->
  a = ((0 for j in [0...n]) for i in [0...n])
  for link in alpha
    a[link[0]][link[1]] = link[2]
  a
