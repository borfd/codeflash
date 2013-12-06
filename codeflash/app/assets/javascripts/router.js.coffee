# For more information see: http://emberjs.com/guides/routing/

Codeflash.Router.map ->
  @resource 'flashcards', ->
	  @resource 'flashcard', { path: ':flashcard_id' }, ->
			@resource 'answers'
  @resource 'answers', path: '/answers', ->
  	@route 'create'