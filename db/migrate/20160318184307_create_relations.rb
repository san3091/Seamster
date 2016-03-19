class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.references :text, index: true, foreign_key: true
      t.references :related_text, index: true

      t.timestamps null: false
    end

    add_foreign_key :relations, :texts, column: :related_text_id
    add_index :relations, [:text_id, :related_text_id], unique: true
  end
end
