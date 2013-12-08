class AddDescriptionToFlashcard < ActiveRecord::Migration
  def change
    add_column :flashcards, :description, :text
  end
end
