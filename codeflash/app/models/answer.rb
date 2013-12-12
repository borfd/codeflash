require "ninja_sandbox/runnable_answer"

class Answer < ActiveRecord::Base
	include NinjaSandbox::RunnableAnswer

	belongs_to :flashcard

	validates_presence_of :code, allow_blank: false


	def expected
		self.flashcard.result unless self.flashcard.nil?
	end

	def verify(result)
		unless self.correct == result
			self.correct = result
			self.save()
		end
		self.correct
	end

	def raycode
		CodeRay.scan(self.code, :ruby).div(line_numers: :table)
	end

end
