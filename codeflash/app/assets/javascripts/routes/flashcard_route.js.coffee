Codeflash.FlashcardRoute = Ember.Route.extend
	actions: 
		verified: (answer) ->
			a = @store.push 'answer', answer.answer
