module NinjaSandbox
	class AnswerVerifier
		def self.run(id, code, expected)
			$LOAD_PATH.unshift(
				File.expand_path("../vendor/jruby-sandbox/lib", 
				__FILE__))
			require "sandbox"		
		
			answer = find(id)
			playground = Sandbox::Safe.new
			answer.verified = (playground.eval(code) == expected)
			answer.save()
			#return answer.verified
		end
	end

end