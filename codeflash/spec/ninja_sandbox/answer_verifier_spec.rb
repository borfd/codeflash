require "ninja_sandbox/answer_verifier"
require_relative "fakes/fake_answer.rb"

describe NinjaSandbox::AnswerVerifier do
	before(:each) do
		@answer = FactoryGirl.create :answer
		@answer.stub(:save)
		@answer.stub(:expected).and_return("44")
	end

	it "should verify correct answer" do
		Answer.stub(:find)
			.with(@answer.id)
			.and_return(@answer)
		NinjaSandbox::AnswerVerifier.run(@answer.id).should eq(@answer)
		@answer.correct.should be_true
	end

	it "should recover from sandbox errors" do
		@answer = FactoryGirl.create :answer, code: "gibberish(*&)#"
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
		
		NinjaSandbox::AnswerVerifier.run(@answer.id)
		@answer.result.should eq("44")
	end

	it "should store exception" do
		@answer.code = "gibberish"
		Answer.stub(:find)
			.with(@answer.id)
			.and_return(@answer)
		NinjaSandbox::AnswerVerifier.run(@answer.id)
		@answer.result.should include("NameError")
	end
  
end