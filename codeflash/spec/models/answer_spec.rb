require 'spec_helper'

describe Answer do
	it { should belong_to(:flashcard) }
  it { should respond_to(:verify) }
  it { should validate_presence_of(:code) } 
  #it { should accept_mass_assignment_of(:answers) }
  it "should call save only when different" do
  	subject.stub(:correct).and_return(true)
  	subject.stub(:save)
  	subject.should_not_receive(:save)
  	subject.verify(true)
  end
end
