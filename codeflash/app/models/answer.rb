require "ninja_sandbox/runnable_answer"

class Answer < ActiveRecord::Base
	include NinjaSandbox::RunnableAnswer

	validates_presence_of :code
	validates_presence_of :result

	belongs_to :flashcard
end
