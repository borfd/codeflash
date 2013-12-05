require 'spec_helper'

describe FlashcardController do
	describe "POST #create" do
		context "with valid attributes" do
			it "creates a new Flashcard object" do
				expect {
					post :create, flashcard: FactoryGirl.create(:flashcard)
				}.to change(Flashcard, :count).by(1)
			end
		end
	end
end
