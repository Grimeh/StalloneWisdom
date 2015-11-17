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
						YOU'RE BETTER THAN THEM!\" ― Sylvester Stallone, Rocky",
		"Like I said, I've got too much respect for women to marry them, but that doesn't mean you can't support them emotionally and financially.",
		"I have great expectations for the future, because the past was highly overrated.",
		"I take rejection as someone blowing a bugle in my ear to wake me up and get going, rather than retreat.",
		"There's a natural law of karma that vindictive people, who go out of their way to hurt others, will end up broke and alone.",
		"I believe any success in life is made by going into an area with a blind, furious optimism.",
		"I believe there's an inner power that makes winners or losers. And the winners are the ones who really listen to the truth of their hearts.",
		"Life is more than sunglasses and hit movies. Reality - that's the main event.",
		"I used to tweet, but it's an act of futility. You're not really making any impact, and if you find yourself in a mood when you wanna be a bit controversial and you post something, you suddenly realise, 'Oh my God!' because you've opened yourself up to a bunch of criticism from strangers.",
		"When I'm doing a movie, I eat the same thing every day. For lunch, it's tuna salad or chicken salad and cole slaw. That's it. For dinner it's either veal and rice, fish and rice or steak and rice. It gets boring; boy, does it get boring.",
		"I am not the richest, smartest or most talented person in the world, but I succeed because I keep going and going and going.",
		"If you don't have a mountain, build one and then climb it. And after you climb it, build another one; otherwise you start to flatline in your life.",
		"I'm not handsome in the classical sense. The eyes droop, the mouth is crooked, the teeth aren't straight, the voice sounds like a Mafioso pallbearer, but somehow it all works.",
		"At the end of the day, 'Rocky' is a love story, and he could never have reached the final bell without Adrian.",
		"You know you've been around when they start to remake your own movies when you're still alive.",
		"I've been involved in something which was chaotic and insane. All I can say now is that I am, and intend to stay, a single man.",
		"I know I'm incredibly unpredictable, and that's the only thing I'm sure of.",
		"I want to turn my attention to movies about love relationships. Exploring the female psyche - there ought to be some interesting discoveries there. Love stories. If you do it right, people want to hear romantic dialog.",
		"When you're scared, when you're hanging on, when life is hurting you, then you're going to see what you're really made of.",
		"If you think people are inherently good, you get rid of the police for 24 hours - see what happens.",
		"If you express yourself too much, you're considered weak.",
		"Success is usually the culmination of controlling failure.",
		"I have two lovely sons and some good memories, but I've had a rather tumultuous personal life. It hasn't been dull; I've been the Hiroshima of love.",
		"I think that gravity sets into everything, including careers, but pendulums do swing and mountains do become valleys after a while... if you keep on walking.",
		"There's no one in the world close to Arnold Schwarzenegger. He is a phenomenon. He's brilliant. Just because his physique belies that, don't underestimate him.",
		"If you're willing to take the humiliation of sticking your head above the crowd, maybe it's, you know, the pleasure will be worth the pain.",
		"For every guy, there is an opportunity to be a lot better than he thought he could be. We can't all be the star of the team, but we can be a star in our life. That's where you set your goal."]

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
