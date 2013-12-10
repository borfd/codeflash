module NinjaSandbox
	class AnswerVerifier

		def self.run(id, code, expected)

			$LOAD_PATH.unshift(
				File.expand_path("../../vendor/jruby-sandbox/lib/", 
				__FILE__))
			require "sandbox"		
		
			playground = Sandbox::Safe.new
			answer = find(id)
			answer.verify(playground.eval(code) == expected)

		end
	end

end