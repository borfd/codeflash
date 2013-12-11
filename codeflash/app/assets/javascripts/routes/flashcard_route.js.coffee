Codeflash.FlashcardRoute = Ember.Route.extend
	actions: 
		verified: (answer) ->
			@store.push 'answer', answer.answer
