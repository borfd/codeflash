require "ninja_sandbox/runnable_answer"

class Answer < ActiveRecord::Base
	include NinjaSandbox::RunnableAnswer

	belongs_to :flashcard

	validates_presence_of :code, allow_blank: false


	def expected
		flashcard.result
	end

	def verify(result)
		unless self.correct == result
			self.correct = result
			self.save()
		end
		self.correct
	end

end
