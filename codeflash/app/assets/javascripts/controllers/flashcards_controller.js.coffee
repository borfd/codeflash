Codeflash.FlashcardsController = Ember.ArrayController.extend

	init: ->
		@_super()
		@get('pusher').subscribe('answers')
	
