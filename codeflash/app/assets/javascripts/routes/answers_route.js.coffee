Codeflash.AnswersRoute = Ember.Route.extend 
	model:  ->
		@store.findAll('answer')