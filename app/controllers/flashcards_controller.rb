class FlashcardsController < ApplicationController
  before_action :set_flashcard, only: [:show, :edit, :update, :destroy]
  respond_to :json
  # GET /flashcards
  # GET /flashcards.json
  def index
    @flashcards = Flashcard.all
    render json: @flashcards
  end

  # GET /flashcards/1
  # GET /flashcards/1.json
  def show
    render json: @flashcard
  end

  # GET /flashcards/new
  def new
    @flashcard = Flashcard.new
    @flashcard.answers.build
  end

  # GET /flashcards/1/edit
  def edit
  end

  # POST /flashcards
  # POST /flashcards.json
  def create
    @flashcard = Flashcard.new(flashcard_params)

    if @flashcard.save
      render json: @flashcard
    else
      render json: @flashcard.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /flashcards/1
  # PATCH/PUT /flashcards/1.json
  def update
    render json: Flashcard.find(params[:id]).tap { |card| card.update_attributes(flashcard_params) }
  end

  # DELETE /flashcards/1
  # DELETE /flashcards/1.json
  def destroy
    @flashcard.destroy
    respond_to do |format|
      format.html { redirect_to flashcards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flashcard
      @flashcard = Flashcard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flashcard_params
      params.require(:flashcard).permit(:description, :result, answers_attributes: [:correct, :code])
    end
end
