Codeflash.FlashcardsCreateRoute = Ember.Route.extend
	model: ->
		Em.Object.create()

	renderTemplate: ->
		@render 'flashcard/create',
			controller: 'flashcardsCreate'