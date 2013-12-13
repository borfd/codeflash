Codeflash.Answer = DS.Model.extend
	code: DS.attr('string')
	flashcard: DS.belongsTo('flashcard')
	date_added: DS.attr('date')
	correct: DS.attr('boolean')
	raycode: DS.attr('string')
	result: DS.attr('string')

	verify: ->
		$.ajax
			url: '/answers/' + @id + '/verify'
			type: "GET"
			success: (data, status, xhr) ->

	imageClass: (->
		if @get('correct')
			return "fa fa-check-square-o right green"
		else
			return "fa fa-exclamation-triangle right red"
	).property('correct')
		