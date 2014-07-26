mocha.ui 'bdd'
mocha.reporter 'html'

describe 'linalg', ->
  describe 'inv', ->
    it 'should return inverse matrix', ->
      a = [
        [1, 2]
        [3, 4]
      ]
      a_inv = sem.linalg.inv(a)

      expect(a_inv).to.be.eql [
        [-2,    1  ]
        [ 1.5, -0.5]
      ]


  describe 'lu_decomposition', ->
    it 'should return decomposited matrix', ->
      a = [
        [ 2,  5,  7]
        [ 4, 13, 20]
        [ 8, 29, 50]
      ]
      lu = sem.linalg.lu_decomposition a

      expect(lu).to.be.eql [
        [2, 5, 7]
        [2, 3, 6]
        [4, 3, 4]
      ]
      return

  describe 'solve', ->
    it 'should return solution of linear system', ->
      a = [
        [3, 1]
        [1, 2]
      ]
      b = [9, 8]
      x = sem.linalg.solve a, b

      expect(x).to.be.eql [2, 3]
      return

if window.mochaPhantomJS
  mochaPhantomJS.run()
else
  mocha.run()
