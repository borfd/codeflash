Codeflash.FlashcardsController = Ember.ArrayController.extend
	unsolvedCards: (->
		@filterProperty('isSolved', false)
	).property('@each.isSolved')
	
