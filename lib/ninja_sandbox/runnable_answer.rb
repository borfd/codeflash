
module NinjaSandbox
	module RunnableAnswer
		extend ActiveSupport::Concern
		def run_verification
			return "asd"
			#AnswerVerifierWorker.perform_async id
		end
	end
end