require 'spec_helper'

describe Answer do
  it "should have a verify method" do
  	subject.should respond_to(:verify)
  end
end
