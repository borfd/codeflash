require 'spec_helper'

 describe Flashcard do
 	it { should have_many(:answers) }
 	it { should validate_presence_of(:description) }
 	it { should validate_presence_of(:result) }
 end