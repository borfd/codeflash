module NinjaSandbox

	class AnswerVerifier
		require "sandbox"

		def self.run(id)
			playground = Sandbox::Safe.new
			answer = Answer.find(id)
			begin
				answer.verify(playground.eval(answer.code).to_s == answer.expected)
			rescue Sandbox::SandboxException
				answer.verify false
			end
			answer.correct
		end

	end

end