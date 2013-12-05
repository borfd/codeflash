require "ninja_sandbox/runnable_answer"

class Answer < ActiveRecord::Base
	include NinjaSandbox::RunnableAnswer

	belongs_to :flashcard

	validates_presence_of :code

	def verify(result)
		unless self.correct == result
			@correct = result
			self.save()
		end
	end

end
