class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :code
      t.text :result
      t.boolean :correct
      t.references :flashcard_id, index: true

      t.timestamps
    end
  end
end
