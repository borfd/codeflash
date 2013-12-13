require 'spec_helper'

describe Answer do

  subject { 
    answer = FactoryGirl.create(:answer)
    answer.stub(:save)
    answer
  }

	it { should belong_to(:flashcard) }
  it { should respond_to(:verify) }
  it { should validate_presence_of(:code) } 

  xit "should call save only when different" do
  	subject.should_not_receive(:save)
  	subject.verify("unicorns & sparkles")
  end

  it "should call save when verified with expected result" do
    subject.should_receive(:save)
    subject.verify(subject.result)
  end

  it "should set correct to false" do
    subject.verify("fak")
    subject.correct.should be_false
  end

end
