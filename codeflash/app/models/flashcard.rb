class Flashcard < ActiveRecord::Base
	has_many :answers
	validates_presence_of :content 
	
end
