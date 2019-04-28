class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :texto
      t.integer :favs
      t.string :sentiment
      t.integer :sentiment_score

      t.timestamps
    end
  end
end
