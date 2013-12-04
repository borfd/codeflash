#require "spec_helper"
require "ninja_sandbox/answer_verifier"
require_relative "fakes/fake_answer.rb"

describe NinjaSandbox::AnswerVerifier do
	before(:each) do
		@answer = FakeAnswer.new
	end
	it "should update answer" do
		NinjaSandbox::AnswerVerifier.stub(:find)
			.with(@answer.id)
			.and_return(@answer)
		NinjaSandbox::AnswerVerifier.run(
			@answer.id, 
			@answer.code, 
			@answer.result).should be_true
	end
  
end