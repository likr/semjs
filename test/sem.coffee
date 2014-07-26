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

describe 'corrcoef', ->
  it 'should return correration coefficient matrix', ->
    x = [
      [1, 1, 1, 3, 1]
      [4, 3, 3, 3, 3]
      [1, 4, 1, 2, 1]
    ]
    r = sem.stats.corrcoef x

    # expect(r).to.be.eql [
    #   [ 1,           -0.25,        0.085749293]
    #   [-0.25,         1,          -0.34299717 ]
    #   [ 0.085749293, -0.34299717,  1          ]
    # ]
    return

describe 'cov', ->
  it 'should return covariance matrix', ->
    x = [
      [1, 1, 1, 3, 1]
      [4, 3, 3, 3, 3]
      [1, 4, 1, 2, 1]
    ]
    sigma = sem.stats.cov x
    # expect(sigma).to.be.eql [
    #   [ 0.64, -0.08,  0.08]
    #   [-0.08,  0.16, -0.16]
    #   [ 0.08, -0.16,  1.36]
    # ]
    return

describe 'solver', ->
  xhr = null
  requests = null

  before ->
    xhr = sinon.useFakeXMLHttpRequest()
    xhr.onCreate = (request) ->
      requests.push request
    requests = []

  after ->
    xhr.restore()

  it 'should post request', (done) ->
    alpha = [
      [1, 0]
      [2, 0]
      [2, 1]
    ]
    sigma = [
      [0, 0]
      [1, 1]
      [2, 2]
    ]
    s = [
      [54.90526316, 7.09473684, 10.36842105]
      [7.09473684, 2.74736842, 2.31578947]
      [10.36842105, 2.31578947, 4.73684211]
    ]
    solver = sem.solver()
    solver(3, alpha, sigma, s)
      .then (result) ->
        expect(result.GFI).to.be 1
        done()
        return

    expect(requests[0].url)
      .to.be 'http://hyperinfo.viz.media.kyoto-u.ac.jp/wsgi/websem/sem'
    expect(requests[0].method).to.be 'POST'
    response =
      GFI: 1
      alpha: [
        [1, 0, 0.129]
        [2, 0, 0.120]
        [2, 1, 0.533]
      ]
      sigma: [
        [0, 0, 54.91]
        [1, 1,  1.83]
        [2, 2,  2,25]
      ]
    header =
      'Content-Type': 'application/json'
    requests[0].respond 200, header, JSON.stringify response
    return


if window.mochaPhantomJS
  mochaPhantomJS.run()
else
  mocha.run()
