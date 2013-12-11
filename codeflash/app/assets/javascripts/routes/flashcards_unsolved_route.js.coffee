Codeflash.FlashcardsUnsolvedRoute = Ember.Route.extend
	setupController: ->
		flashcards = @store.filter 'flashcard', (card) ->
			not card.get('isSolved')
		@controllerFor('flashcards').set 'filteredFlashcards', flashcards
