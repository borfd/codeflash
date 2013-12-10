require "ninja_sandbox/answer_verifier"
require_relative "fakes/fake_answer.rb"

describe NinjaSandbox::AnswerVerifier do
	before(:each) do
		@answer = FactoryGirl.create :answer
		@answer.stub(:save)
	end

	it "should verify correct answer" do
		Answer.stub(:find)
			.with(@answer.id)
			.and_return(@answer)
		NinjaSandbox::AnswerVerifier.run(@answer.id).should be_true
		@answer.correct.should be_true
	end

	it "should recover from sandbox errors" do
		@answer = FactoryGirl.create :answer, code: "gibberish(*&)#"
		@answer.stub_chain(:flashcard, :result).and_return("2")
		Answer.stub(:find)
			.with(@answer.id)
			.and_return(@answer)
		NinjaSandbox::AnswerVerifier.run(@answer.id).should be_false
		@answer.correct.should be_false
	end
  
end