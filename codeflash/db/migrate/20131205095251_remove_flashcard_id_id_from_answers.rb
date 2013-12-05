class RemoveFlashcardIdIdFromAnswers < ActiveRecord::Migration
  def self.up
  	remove_column :answers, :flashcard_id_id
  end
  def self.down
  	add_column :answers, :flashcard_id_id
  end
end
