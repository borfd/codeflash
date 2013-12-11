#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require codeflash
#= require_tree ../../../vendor/assets/javascripts/.

window.Codeflash = Ember.Application.create
	ready: ->
		@register "pusher:main", Codeflash.Pusher, 
			singleton: true
		@inject('controller', 'pusher', 'pusher:main')
