Codeflash.Answer = DS.Model.extend
	code: DS.attr('string')
	flashcard: DS.belongsTo('flashcard')
	date_added: DS.attr('date')