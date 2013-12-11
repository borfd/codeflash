# For more information see: http://emberjs.com/guides/routing/

Codeflash.Router.map ->
  @resource 'flashcards', ->
  	@route 'unsolved'
	 	@route 'create'
	  @resource 'flashcard', { path: ':flashcard_id' }, ->
	  	@route 'edit'

  @resource 'answers', path: '/answers', ->
  	@route 'create'