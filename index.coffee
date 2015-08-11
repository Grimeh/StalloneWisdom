Slack = require 'slack-client'
token = 'xoxb-8966076468-AiOwcaC01LizsUn1VUezHxR2'
request = require 'request'

`function getRandomInt(min, max) {
		return Math.floor(Math.random() * (max - min)) + min;
}`

quotes = [
		"\"Let me tell you something you already know. The world ain't all sunshine and rainbows. It's a very mean and nasty place and I don't care how tough you are it will beat you to your knees and keep you there permanently if you let it. You, me, or nobody is gonna hit as hard as life. But it ain't about how hard ya hit. It's about how hard you can get hit and keep moving forward. How much you can take and keep moving forward. That's how winning is done!\" ― Sylvester Stallone, Rocky Balboa",
		"\"Life's not about how hard of a hit you can give... it's about how many you can take, and still keep moving forward.\" ― Sylvester Stallone, Rocky Balboa",
		"\"I learned the real meaning of love. Love is absolute loyalty. People fade, looks fade, but loyalty never fades. You can depend so much on certain people, you can set your watch by them. And that's love, even if it doesn't seem very exciting.\" ― Sylvester Stallone",
		"\"Let me tell you something you already know. The world ain't all sunshine and rainbows. It's a very mean and nasty place, and I don't care how tough you are, it will beat you to your knees and keep you there permanently if you let it. You, me, or nobody is gonna hit as hard as life. But it ain't about how hard you hit. It's about how hard you can get hit and keep moving forward; how much you can take and keep moving forward. That's how winning is done! Now, if you know what you're worth, then go out and get what you're worth. But you gotta be willing to take the hits, and not pointing fingers saying you ain't where you wanna be because of him, or her, or anybody. Cowards do that and that ain't you. You're better than that! I'm always gonna love you, no matter what. No matter what happens. You're my son and you're my blood. You're the best thing in my life. But until you start believing in yourself, you ain't gonna have a life.\" ― Sylvester Stallone, Rocky Balboa",
		"\"It Ain’t How Hard You Hit…It’s How Hard You Can Get Hit and Keep Moving Forward. It's About How Much You Can Take And Keep Moving Forward!\" ― Sylvester Stallone, Rocky Balboa",
		"\"Without love, loyalty, desires, passion, courage, dignities, faith, beliefs and all the other ingredients that go into making the human soul something so elevated that only God knows its limits, we are only shells bobbing aimlessly in a calm sea of mediocrity. ...And if you can figure that out, please write and explain it to me because you're a better man than I am.\" ― Sylvester Stallone",
		"\"Let me tell you something you already know. The world ain’t all sunshine and rainbows. It’s a very mean and nasty place, and I don’t care how tough you are, it will beat you to your knees and keep you there permanently if you let it. You, me, or nobody is gonna hit as hard as life. But it ain’t about how hard you hit. It’s about how hard you can get hit and keep moving forward; how much you can take and keep moving forward. That’s how winning is done! Now, if you know what you’re worth, then go out and get what you’re worth. But you gotta be willing to take the hits, and not pointing fingers saying you ain’t where you wanna be because of him, or her, or anybody. Cowards do that and that ain’t you. You’re better than that!\" ― Sylvester Stallone",
		"\"It ain't over till its over\" ― Sylvester Stallone",
		"\"Consider the source...Don't be a fool by listening to a fool.\" ― Sylvester Stallone, Sly Moves: My Proven Program to Lose Weight, Build Strength, Gain Will Power, and Live your Dream",
		"\"The man who can best gets along with women, is the man who can get along without them.\" ― Sylvester Stallone",
		"\"I am making a correction to one of the quotes you guys have for Sly Stallone; It's not ethical to put \" \" around words saying a person said something and did not. Hence the meaning of quoting someone; means that person said exactly what you're putting quotes around-Verbatim. Here's the real quote by Sly Stallone in Rocky Balboa; \"It ain't about how hard you can hit it's about how hard you can get hit and keep moving forward. How much you can take and keep moving forward. That's how winning is done.\" Under your quote guidelines should read only enter quotes if you without a doubt are in fact quoting something someone said verbatim.\" ― Sylvester Stallone",
		"\"Like I said, I’ve got too much respect for women to marry them, but that doesn’t mean you can’t support them emotionally and financially.\" ― Sylvester Stallone",
		"\"It would be great to be able to pass on to someone all of the successes, the failures, and the knowledge that one has had. To help someone, avoid all the fire, pain and anxiety would be wonderful.\" ― Sylvester Stallone",
		"\"Life's not about how hard of a hit you can give...
		It's about how many you can take, and still keep moving forward.
				How much you can take and keep moving forward.
				That’s how winning is done!
				Now, if you know what you’re worth, then go out and get what you’re worth.
						But you gotta be willing to take the hits,
						And not pointing fingers saying you ain’t where you wanna be because of him, or her, or anybody.
						COWARDS DO THAT AND THAT AIN'T YOU.
						YOU'RE BETTER THAN THEM!\" ― Sylvester Stallone, Rocky"]

# Slack stuff
slack = new Slack token
slack.on 'open', ->
		console.log 'Stallone ready'

slack.on 'message', (message) ->
		{ channel, type } = message
		text = message.toString()
		channel = slack.getChannelGroupOrDMByID channel
		console.log 'text: ' + text
		if channel.name is 'general'
				return

		if type is 'message' and text? and channel? and text.match /stallone/ig
				channel.send quotes[getRandomInt(0, quotes.length)]

slack.on 'error', (err) ->
		console.error "Error: #{err}"

slack.login()
