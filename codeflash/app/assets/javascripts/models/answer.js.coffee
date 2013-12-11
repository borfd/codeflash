Codeflash.Answer = DS.Model.extend
	code: DS.attr('string')
	flashcard: DS.belongsTo('flashcard')
	date_added: DS.attr('date')
	correct: DS.attr('boolean')

	verify: ->
		$.ajax
			url: '/answers/' + @id + '/verify'
			type: "GET"
			success: (data, status, xhr) ->
		