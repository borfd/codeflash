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
	
		factory :flashcard_with_answers do
			after(:create) do |f| 
				FactoryGirl.create_list(:answer, 5, :flashcard => f)
			end
		end

	end
	
end