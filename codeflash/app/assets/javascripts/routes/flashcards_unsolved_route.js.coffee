Codeflash.FlashcardsUnsolvedRoute = Ember.Route.extend
	setupController: ->
		flashcards = @modelFor('flashcards').filterProperty 'isSolved', false
		@controllerFor('flashcards').set 'filteredFlashcards', flashcards
