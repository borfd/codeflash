require "ninja_sandbox/runnable_answer"

class Answer < ActiveRecord::Base
	include NinjaSandbox::RunnableAnswer

	belongs_to :flashcard

	validates_presence_of :code
	validates_presence_of :correct
	validates_presence_of :flashcard

	def verify(result)
		unless self.correct == result
			@correct = result
			self.save()
		end
	end

end
