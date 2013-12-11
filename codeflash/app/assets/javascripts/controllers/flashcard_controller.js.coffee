Codeflash.FlashcardController = Ember.ObjectController.extend
	actions: 
		save: ->	
			answer = @store.createRecord 'answer', @get('new_answer')
			# Sandi says NO!
			# Move into AnswersController
			@get('model').get('answers').pushObject(answer)
			answer.save().then ->
				answer.verify()

	new_answer: Em.Object.create()
