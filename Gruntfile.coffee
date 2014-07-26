module.exports = (grunt) ->
  grunt.initConfig
    browserify:
      dist:
        files:
          'sem.js': ['src/index.js']
    coffee:
      src:
        files: [
          expand: true
          cwd: 'src/'
          src: ['**/*.coffee']
          dest: 'src'
          ext: '.js'
        ]
      test:
        files: [
          expand: true
          cwd: 'test/'
          src: ['**/*.coffee']
          dest: 'test'
          ext: '.js'
        ]
    mocha_phantomjs:
      options:
        reporter: 'list'
      all: ['test/**/*.html']
    watch:
      src:
        files: ['src/**/*.coffee']
        tasks: ['compile:src', 'test']
      test:
        files: ['test/**/*.coffee', 'test/**/*.html']
        tasks: ['compile:test', 'test']

    grunt.loadNpmTasks 'grunt-browserify'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-mocha-phantomjs'

    grunt.registerTask 'compile', ['coffee', 'browserify']
    grunt.registerTask 'default', ['compile']
    grunt.registerTask 'test', ['mocha_phantomjs']
