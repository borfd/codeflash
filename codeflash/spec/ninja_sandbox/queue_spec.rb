require "ninja_sandbox/queue"
require_relative "fakes/fake_answer.rb"

describe NinjaSandbox::Queue do
	before(:each) do
		@answer = FakeAnswer.new
	end
	xit { should respond_to(:enqueue) }

	it "should delegate enqueue to Queue Classic" do 
		q = double('q').stub(:enqueue)
		q.should_receive(:enqueue)
		
		queue = NinjaSandbox::Queue.new(q)
		queue.enqueue @answer
	end
end