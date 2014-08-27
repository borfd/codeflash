class Flashcard < ActiveRecord::Base
	has_many :answers
	validates_presence_of :description
	validates_presence_of :result
	accepts_nested_attributes_for :answers

end
