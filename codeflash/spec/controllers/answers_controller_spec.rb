require 'spec_helper'

describe AnswersController do
	describe "GET #index" do

		before(:each) do
			@flashcard = FactoryGirl.create :flashcard_with_answers
			@answers = @flashcard.answers
			get :index, flashcard_id: @flashcard.id
		end

		it "fills an array of answers" do
			assigns(:answers).should eq(@answers)
		end

		it "returns json representation of all answers" do
			body = JSON.parse(response.body)
			body["answers"].each do |a|
				# binding.pry
				a["answers"]["id"].should be_in(@answers.pluck(:id))
			end
		end
	end
end
