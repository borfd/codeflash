module NinjaSandbox

	module RunnableAnswer	
		def verify(queue)
			queue.enqueue("NinjaSandbox::AnswerVerifier.run",
				 self.id,
				 self.code,
				 self.result
			)
		end
	end

end