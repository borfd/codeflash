Codeflash.FlashcardsController = Ember.ArrayController.extend

	# This method breaks data binding
	init: ->
		@_super()
		@get('pusher').subscribe('answers')

	unsolvedCards: (->
		@filterProperty('isSolved', false)
	).property('@each.isSolved')
	
