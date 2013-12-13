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
		NinjaSandbox::AnswerVerifier.run(@answer.id).should eq(@answer)
		@answer.correct.should be_false
	end

	it "should store answer after verification" do
		Answer.stub(:find)
			.with(@answer.id)
			.and_return(@answer)
		expect {
		NinjaSandbox::AnswerVerifier.run(@answer.id)

		}.to change(@answer.result).to("4")
	end
  
end