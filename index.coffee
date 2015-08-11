Slack = require 'slack-client'
token = 'xoxb-6331522865-aW53wV10Q3KNjUOfHglvX3iF'
request = require 'request'

# `function getRandomInt(min, max) {
# 		return Math.floor(Math.random() * (max - min)) + min;
# }`

# Slack stuff
slack = new Slack token
slack.on 'open', ->
		console.log 'ShushBot ready'

slack.on 'message', (message) ->
		{ channel, type } = message
		text = message.toString()
		channel = slack.getChannelGroupOrDMByID channel
		console.log 'text: ' + text
		if channel.name is 'general'
				return

		if type is 'message' and text? and channel? and text.match /keanureeves:/g
				channel.send 'Shut up, keanoo'

slack.on 'error', (err) ->
		console.error "Error: #{err}"

slack.login()
