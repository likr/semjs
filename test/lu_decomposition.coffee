mocha.ui 'bdd'
mocha.reporter 'html'

describe 'lu_decomposition', () ->
  it 'should run', () ->
    a = [
      [ 2,  5, 7]
      [ 4, 13, 20]
      [ 8, 29, 50]
    ]
    sem.lu_decomposition a

    expect(a).to.be.eql [
      [2, 5, 7]
      [2, 3, 6]
      [4, 3, 4]
    ]

if window.mochaPhantomJS
  mochaPhantomJS.run()
else
  mocha.run()
