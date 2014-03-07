Codeflash.Flashcard = DS.Model.extend
	description: DS.attr 'string'
	result: DS.attr 'string'
	answers: DS.hasMany	'answer',
		async: true

	isSolved: (->
		@get('answers.length') > 0 and @get('answers')?.any (a) -> a.get('correct')
	).property('answers.@each.correct')
