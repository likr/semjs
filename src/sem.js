var semjs = function() {
  var url = 'http://hyperinfo.viz.media.kyoto-u.ac.jp/wsgi/websem';
  var data = [];
  var S;

  var solver = function(n, alpha, sigma) {
    var covRequest = {
      data: data
    };

    return solver.cov()
      .then(function(S) {
        return $.ajax({
          type: 'POST',
          url: url + '/sem',
          data: JSON.stringify({
            n: n,
            alpha: alpha,
            sigma: sigma,
            S: S
          }),
          contentType: 'application/json'
        });
      });
  };

  solver.url = function() {
    if (arguments.length === 0) {
      return url;
    }
    url = arguments[0];
    return solver;
  };

  solver.data = function() {
    if (arguments.length === 0) {
      return data;
    }
    data = arguments[0];
    return solver;
  };

  solver.S = function() {
    if (arguments.length === 0) {
      return S;
    }
    S = arguments[0];
    return solver;
  };

  solver.cov = function() {
    var deferred = $.Deferred();
    if (S === undefined) {
      $.ajax({
        type: 'POST',
        url: url + '/cov',
        data: JSON.stringify({
          data: data
        }),
        contentType: 'application/json'
      })
      .then(function(response) {
        S = response.data.map(function(row) {
          return row.map(function(s) {
            return +s;
          });
        });
        deferred.resolve(S);
      });
    } else {
      deferred.resolve(S);
    }
    return deferred.promise();
  };

  return solver;
};
