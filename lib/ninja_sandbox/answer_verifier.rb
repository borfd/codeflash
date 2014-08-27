module NinjaSandbox

	class AnswerVerifier
		require "sandbox"

		def self.run(id)
			playground = Sandbox::Safe.new
			answer = Answer.find(id)
			begin
				eval_result = playground.eval(answer.code).to_s
			rescue Sandbox::SandboxException => ex
				eval_result = ex.message
			end
			answer.verify eval_result
			answer
		end

	end

end
