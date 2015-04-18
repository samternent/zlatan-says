module.exports = function(grunt) {
  require("matchdep").filterAll("grunt-*").forEach(grunt.loadNpmTasks);

  grunt.initConfig({
    //
    // Dev watch taks
    //

    watch: {
      files: [
        'src/javascripts/**/*.coffee'
      ]
    },

    //
    // Clean 'dist' folder
    //

    clean: {
      build: {
        src: ['dist']
      }
    },

    browserify: {

      app: {
        files: {
          'dist/build_app.js': [
            'src/javascripts/**/*.coffee',
          ],
        },
        options: {
          transform: ['coffeeify'],
          watch: true,
          keepAlive: true
        }
      }
    },

    sass: {
      dist: {
        options: {
          style: 'compressed',
          sourcemap: 'none',
          update: true
        },
        files: {
          'dist/build_app.css': 'src/styles/app.scss'
        }
      }
    },

    //
    // Build Coffee script
    //

    coffee: {
      build: {
        expand: true,
        options: {
          bare: true
        },
        cwd: 'src',
        src: ['**/*.coffee'],
        dest: 'dist',
        ext: '.js'
      }
    }
  });

  grunt.registerTask("dev", ["sass", "browserify", "watch"]);
  grunt.registerTask("bundle", ["clean", "coffee", "browserify", "sass"]);
};
