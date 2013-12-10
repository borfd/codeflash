require "ninja_sandbox/answer_verifier"

class AnswersController < ApplicationController
	respond_to :json
	before_action :set_answer, only: [:show]
	def index
		@answers = params[:ids] ? Answer.find(params[:ids]) : Answer.find()
		render json: @answers
	end

	def create
		@answer = Answer.create(answer_params)
		render json: @answer
	end

	def show
		render json: @answer
	end

	def verify
		answer = Answer.find(params[:answer_id])
		AnswerVerifierWorker.perform_async answer.id
		render json: answer
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:code, :correct, :flashcard_id)
    end

end
