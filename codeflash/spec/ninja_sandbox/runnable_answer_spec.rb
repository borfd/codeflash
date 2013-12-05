require 'ostruct'
require_relative "../../lib/ninja_sandbox/runnable_answer"
require_relative "fakes/fake_answer.rb"

describe NinjaSandbox::RunnableAnswer do
  
  let (:answer) { FakeAnswer.new }
  
  before { answer.extend NinjaSandbox::RunnableAnswer }

  it "should add processing job to Queue" do
  	queue = double()
  	queue.should_receive(:enqueue).with("NinjaSandbox::AnswerVerifier.run", answer.id, answer.code, answer.result)
  	answer.enqueue_verification(queue)
  end




end