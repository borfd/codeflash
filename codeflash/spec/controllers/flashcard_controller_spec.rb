require 'spec_helper'

describe FlashcardsController do

	describe "GET #index" do 
		it "fills an array of flashcards" do
			flashcard = FactoryGirl.create :flashcard
			get :index
			assigns(:flashcards).should eq([flashcard])
		end

		it "renders the index view" do
			get :index
			response.should render_template(:index)
		end
	end

	describe "GET #show" do
		it "assigns the requested flashcard" do
			flashcard = FactoryGirl.create :flashcard
			get :show, id: flashcard
			assigns(:flashcard).should eq(flashcard)
		end
	end

	describe "POST #create" do
		context "with valid attributes" do
			it "creates a new Flashcard object" do
				expect {
					post :create, flashcard: FactoryGirl.create(:flashcard)
				}.to change(Flashcard, :count).by(1)
			end
			it "creates a new Answer object" do
				expect {
					post :create, flashcard: FactoryGirl.create(:flashcard)
				}.to change(Answer, :count).by(1)
			end
		end
	end

end
