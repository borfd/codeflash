Codeflash.FlashcardsController = Ember.ArrayController.extend
	unsolvedCards: (->
		@get('content')?.filterProperty('isSolved', false)
	).property('@each.isSolved')
	
