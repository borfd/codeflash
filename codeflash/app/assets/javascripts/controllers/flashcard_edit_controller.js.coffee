Codeflash.FlashcardEditController = Ember.ObjectController.extend
	actions:
		save: ->
			flashcard = @get('model')
			flashcard.save().then =>
				flashcard.get('answers').map (item) ->
					item.verify()
				@transitionToRoute('flashcard', flashcard)