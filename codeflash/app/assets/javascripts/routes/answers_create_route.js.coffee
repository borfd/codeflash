Codeflash.AnswersCreateRoute = Ember.Route.extend
	model: ->
		@modelFor('answer')

	renderTemplate: ->
		@render('answer.edit',
			controller: "answersCreate"
		)