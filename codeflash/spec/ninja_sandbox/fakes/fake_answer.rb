class FakeAnswer
	def id; 7; end
	def code
		 "[1, 2, 3, 4].inject(0) do |result, element| 
		 	result + element
		 end"
	end
	def result; 10; end
	def save; true; end
	def correct=(_); true; end
	def correct; true; end
	def verify(_); true; end;
end