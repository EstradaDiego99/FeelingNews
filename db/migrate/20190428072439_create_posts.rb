class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :texto
      t.integer :favs
      t.integer :hashtags
      t.integer :shares
      t.integer :tags
      t.string :concept
      t.integer :concept_score
      t.string :keyword
      t.integer :keyword_score
      t.string :category
      t.integer :category_score
      t.string :entity
      t.integer :entity_score

      t.timestamps
    end
  end
end
