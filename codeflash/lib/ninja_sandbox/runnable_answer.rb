module NinjaSandbox
	module RunnableAnswer
		def enqueue_verification(queue)
			queue.enqueue("NinjaSandbox::AnswerVerifier.run",
				 self.id,
				 self.code,
				 self.result
			)
		end
	end
end