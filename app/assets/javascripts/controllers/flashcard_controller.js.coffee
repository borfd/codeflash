Codeflash.FlashcardController = Ember.ObjectController.extend
	needs: 'flashcards'
	actions:
		save: ->
			answer = @store.createRecord 'answer', @get('new_answer')
			# Sandi says NO!
			# Move into AnswersController
			@get('model').get('answers').pushObject(answer)
			answer.save().then ->
				answer.verify()
			@set('new_answer', Em.Object.create())
		destroyAnswer: (m) ->
			@get('model.answers').removeObject(m)
			m.deleteRecord()
			m.save()
		destroy: ->
			m = @get('model')
			m.deleteRecord()
			m.save()
			@transitionToRoute('flashcards')


	new_answer: Em.Object.create()
