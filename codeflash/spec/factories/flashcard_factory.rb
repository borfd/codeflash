require 'factory_girl'



FactoryGirl.define do

	factory :answer do
		correct false
	end

	factory :flashcard do
		sequence :content do |n|
			"1+#{n}"
		end
		factory :flashcard_with_answers do
			after(:create) do |card, evaluator|
				FactoryGirl.create_list(:answer, 1, flashcard: card, code: content)

			end
		end
	end
	
end