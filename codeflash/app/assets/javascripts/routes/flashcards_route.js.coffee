Ember.FlashcardsRoute = Ember.Route.extend 
	model: ->
		App.Flashcard.find()