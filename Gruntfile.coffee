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
            path = if type is 'scss' || type is 'fonts' && component is 'bootstrap'
                     "#{type}/#{component}"
                   else
                     type
            path
          install: true
          cleanTargetDir: true
          cleanBowerDir: false

    esteWatch:
      options:
        dirs: [ 'assets' ]
      'coffee': (path) -> [ 'coffee' ]
      'scss': (path) -> [ 'compass', 'cssmin' ]

  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-este-watch'
  grunt.registerTask 'make', [ 'bower', 'coffee', 'compass', 'cssmin' ]
  grunt.registerTask 'default', [ 'make', 'esteWatch' ]
