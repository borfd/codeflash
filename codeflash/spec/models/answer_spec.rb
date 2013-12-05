require 'spec_helper'

describe Answer do
  it { should respond_to(:verify) }
  it { should belong_to(:organization) }
  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:result) }
end
