require 'factory_girl'


FactoryGirl.define do

	factory :answer do
		correct true
		code "42+2"
		flashcard
	end

	factory :flashcard do
		result "44"
		content "44"
	
		factory :flashcard_with_answers, :parent => :flashcard do |flashcard|
			flashcard.after_create { |f| FactoryGirl.build(:answer, :flashcard => f)}
		end

	

	end
	
end