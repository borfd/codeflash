class AnswersController < ApplicationController
	# respond_to :json
	def index
		@answers = Answer.where(flashcard_id: params[:flashcard_id])
		render json: @answers
	end
end
