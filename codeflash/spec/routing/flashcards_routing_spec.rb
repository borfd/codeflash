require 'spec_helper'

describe "routes for Flashcards" do
	it "routes /flashcards to flashcards controller" do
		expect(get("/flashcards")).to route_to("flashcards#index")
	end
	it "routes /flashcards/show to show action" do
		expect(get("/flashcards/1")).to route_to(
			controller: "flashcards",
			action: "show",
			id: "1"
		)
	end
	it "routes post /flashcards to create action" do
		expect(post("/flashcards/1")).to route_to(
			controller: "flashcards",
			action: "create",
			id: "1"
		)
	end

		it "routes post /flashcards to create action" do
		expect(patch("/flashcards/1")).to route_to(
			controller: "flashcards",
			action: "update",
			id: "1"
		)
	end
end