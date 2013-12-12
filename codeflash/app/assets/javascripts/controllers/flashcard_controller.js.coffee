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
		destroy: (m) ->
			@get('model.answers').removeObject(m)
			m.deleteRecord()
			m.save()


	new_answer: Em.Object.create()
