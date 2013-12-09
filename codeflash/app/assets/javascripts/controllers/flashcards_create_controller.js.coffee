Codeflash.FlashcardsCreateController = Ember.ObjectController.extend
	needs: "flashcards"
	flashcards: Ember.computed.alias("controllers.flashcards.model")
	actions:
		save: ->
			newFlashcard = @store.createRecord 'flashcard', @get('model')
			newFlashcard.save().then (card) =>
				@transitionToRoute('flashcard', card)
