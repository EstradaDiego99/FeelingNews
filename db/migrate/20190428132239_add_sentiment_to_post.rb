class AddSentimentToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :sentiment, :string
  end
end
