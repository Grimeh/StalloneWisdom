module.exports = (grunt) ->
		grunt.initConfig
				coffee:
						options:
								bare: true
						index:
								files:
										'index.js': 'index.coffee'

		grunt.loadNpmTasks 'grunt-contrib-coffee'

		grunt.registerTask 'default', ['coffee']
