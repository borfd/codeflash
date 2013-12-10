require "ninja_sandbox/answer_verifier"

class AnswerVerifierWorker
	include Sidekiq::Worker
	sidekiq_options :retry => false

	def perform(id)
		NinjaSandbox::AnswerVerifier.run id
	end
end