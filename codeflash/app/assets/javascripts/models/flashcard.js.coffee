Codeflash.Flashcard = DS.Model.extend
	description: DS.attr('string')
	result: DS.attr('string')
	answers: DS.hasMany('answer', {async: true, embedded: true})
