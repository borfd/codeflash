Codeflash.FlashcardsRoute = Ember.Route.extend 
	model: ->
		@store.findAll('flashcard')

