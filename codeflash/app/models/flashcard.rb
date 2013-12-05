class Flashcard < ActiveRecord::Base
	has_many :answers
	validates_presence_of :content 
	accepts_nested_attributes_for :answers

end
