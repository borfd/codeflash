require 'spec_helper'

describe AnswersController do
	describe "GET #index" do

		before(:each) do
			@flashcard = FactoryGirl.create :flashcard_with_answers
			@answers = @flashcard.answers
			get :index, id: @flashcard.id
		end

		xit "fills an array of answers" do
			assigns(:answers).should eq(@answers)
		end

		xit "returns json representation of all answers" do
			body = JSON.parse(response.body)
			body["answers"].each do |a|
				a["answers"]["id"].should be_in(@answers.pluck(:id))
			end
		end
	end

	describe "GET #verify" do
		before(:each) do
			@answer = FactoryGirl.create :answer
		end
		it "should enqueue_verification on this answer object" do
			get :verify, answer_id: @answer.id
			expect(@answer).to  receive(:run_verification).once
		end
	end
end
