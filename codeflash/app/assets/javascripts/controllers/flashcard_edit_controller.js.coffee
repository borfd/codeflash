Codeflash.FlashcardEditController = Ember.ObjectController.extend
	actions:
		save: ->
			flashcard = @get('model').save().then =>
				@transitionToRoute('flashcard', flashcard)