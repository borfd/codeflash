require "ninja_sandbox/runnable_answer"

class Answer < ActiveRecord::Base
	include NinjaSandbox::RunnableAnswer

	belongs_to :flashcard

	validates_presence_of :code, allow_blank: false


	def expected
		self.flashcard.result
	end

	def verify(result)
		self.correct = validate_result(result)
		self.result = result
		self.save()
		self.correct
	end

	def raycode
		CodeRay.scan(self.code, :ruby).div(line_numers: :table)
	end
	private
		def validate_result(result)
			compare(result, expected)
		end

		def compare(a, b)
			compare_func(a) == compare_func(b)
		end

		def compare_func(val)
			val.delete('n').delete(' ')
		end
end
