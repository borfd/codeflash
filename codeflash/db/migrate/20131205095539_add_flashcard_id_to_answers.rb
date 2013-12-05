class AddFlashcardIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :flashcard_id, :int
  end
end
