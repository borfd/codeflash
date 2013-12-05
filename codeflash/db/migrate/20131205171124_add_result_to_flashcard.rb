class AddResultToFlashcard < ActiveRecord::Migration
  def change
    add_column :flashcards, :result, :text
  end
end
