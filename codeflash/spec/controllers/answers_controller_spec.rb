require 'spec_helper'

describe AnswersController do
	describe "GET #index" do
		it "fills an array of answers" do
			flashcard = FactoryGirl.create(:flashcard_with_answers)
			answer = flashcard.answers.first
			get :index, flashcard_id: answer.flashcard_id
			assigns(:answers).should eq([answer])
		end
	end
end
