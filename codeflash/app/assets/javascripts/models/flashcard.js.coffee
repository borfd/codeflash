Codeflash.Flashcard = DS.Model.extend
	description: DS.attr 'string'
	result: DS.attr 'string' 
	answers: DS.hasMany	'answer', 
		async: true

	isSolved: (->
		@get('answers.length') > 0 and @get('answers')?.everyBy 'correct'
	).property('answers.@each.correct')
