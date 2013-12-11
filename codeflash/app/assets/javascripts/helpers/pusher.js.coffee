Codeflash.Pusher = Ember.Object.extend
	key: '26989071e21344c8fdc0',

	init: ->
		@service = new Pusher(@get("key"))
		@service.connection.bind 'connected', =>
			@connected()
		@service.bind_all (eventName, data) =>
			@handleEvent eventName, data

	connected: ->
		@socketId = @service.connection.socket_id
		@addSocketIdToXHR()

	addSocketIdToXHR: ->
		Ember.$.ajaxPrefilter (options, origOptions, xhr) =>
			xhr.setRequestHeader 'X-Pusher-Socket', @socketId

	subscribe: (channel) ->
		@service.subscribe channel

	unsubscribe: (channel) ->
		@service.unsubscribe channel

	handleEvent: (eventName, data) ->
		return if /^pusher:/.test(eventName)
		router = @get("container").lookup("router:main")
		try
		  router.send eventName, data
		catch e
			handled = e.message.match /Nothing handled the event/
			throw e unless handled
		  