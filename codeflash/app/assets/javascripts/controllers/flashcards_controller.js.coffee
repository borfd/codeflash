Codeflash.FlashcardsController = Ember.ArrayController.extend

	init: ->
		@get('pusher').subscribe('answers')

	unsolvedCards: (->
		@filterProperty('isSolved', false)
	).property('@each.isSolved')
	
