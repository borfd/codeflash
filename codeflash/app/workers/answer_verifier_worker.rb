require "ninja_sandbox/answer_verifier"
require 'pusher'

Pusher.url = "http://26989071e21344c8fdc0:14281b97165a417e48b8@api.pusherapp.com/apps/61364"

class AnswerVerifierWorker
	include Sidekiq::Worker
	sidekiq_options :retry => false

	def perform(id)
		result = NinjaSandbox::AnswerVerifier.run(id)
		answer = AnswerSerializer.new(result)
		Pusher["answers"].trigger('verified', answer.to_json)
	end
end