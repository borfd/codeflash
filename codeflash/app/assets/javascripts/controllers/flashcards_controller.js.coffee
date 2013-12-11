Codeflash.FlashcardsController = Ember.ArrayController.extend
	filtering: false
	init: ->
		@_super()
		@get('pusher').subscribe('answers')
	
	actions:
		enableFilter: ->
			@set('filtering', true)
		disableFilter: ->
			@set('filtering', false)

	filteredFlashcards: (-> 
			return @filterProperty 'isSolved', false if @get('filtering')
			return @get('model') unless @get('filtering')
	).property('@each.isSolved', 'filtering')

	unsolvedRemaining: (->
		@filterProperty('isSolved', false).get('length')
	).property('@each.isSolved')