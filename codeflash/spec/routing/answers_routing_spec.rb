require "spec_helper"

describe AnswersController do
	describe "routing"

	it "routes to #verify" do
		get('/answers/1/verify').should route_to(
			controller: "answers",
			answer_id: "1",
			action: "verify"
		)
	end
	
end