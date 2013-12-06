# For more information see: http://emberjs.com/guides/routing/

App.Router.map ()->
  @resource 'flashcards', ->
  	@resource 'flashcard', path: ":flashcard_id"

