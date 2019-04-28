class AddSentimentScoreToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :sentiment_score, :integer
  end
end
