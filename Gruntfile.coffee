module.exports = (grunt) ->
  grunt.initConfig
    browserify:
      main:
        files:
          'sem.js': ['lib/index.js']
        options:
          browserifyOptions:
            standalone: 'sem'
      test:
        files:
          'test/sem-test.js': ['test/index.js']
    coffee:
      main:
        files: [
          expand: true
          cwd: 'src/'
          src: ['**/*.coffee']
          dest: 'lib'
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
      main:
        files: ['src/**/*.coffee']
        tasks: ['build:main', 'test']
      test:
        files: ['test/**/*.coffee', 'test/**/*.html']
        tasks: ['build:test', 'test']

    grunt.loadNpmTasks 'grunt-browserify'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-mocha-phantomjs'

    grunt.registerTask 'build', ['build:main', 'build:test']
    grunt.registerTask 'build:main', ['coffee:main']
    grunt.registerTask 'build:test', ['coffee:test', 'browserify:test']
    grunt.registerTask 'default', ['build', 'test']
    grunt.registerTask 'dist', ['build:main', 'browserify:main']
    grunt.registerTask 'test', ['mocha_phantomjs']
