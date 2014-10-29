module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        options:
          bara: true
        files: [
          expand: true
          cwd: 'assets'
          src: [ '**/*.coffee' ]
          dest: 'public/js/'
          ext: '.js'
        ]

    compass:
      dist:
        options:
          sassDir: 'assets'
          cssDir: 'public/css/'

    cssmin:
      my_target:
        files: [
          expand: true,
          cwd: 'public/css',
          src: [ '*.css', '!*.min.css' ],
          dest: 'public/css/',
          ext: '.min.css'
        ]

    bower:
      install:
        options:
          targetDir: 'public'
          layout: (type, component) ->
            if type is 'scss'
              return "#{type}/#{component}"
            else
              return type
          install: true
          cleanTargetDir: true
          cleanBowerDir: false

  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks('grunt-contrib-cssmin')
  grunt.registerTask 'default', [ 'bower', 'coffee', 'compass', 'cssmin' ]
