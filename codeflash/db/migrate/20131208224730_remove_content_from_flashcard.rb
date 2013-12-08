class RemoveContentFromFlashcard < ActiveRecord::Migration
  def change
    remove_column :flashcards, :content, :text
  end
end
