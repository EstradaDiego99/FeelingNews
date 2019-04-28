class Post < ApplicationRecord
  has_many :comments, :foreign_key => :post_id

  def sentiment
    sentiment = 0
    comments.each do |comment|
      sentiment += comment.sentiment_score
    end
    return sentiment
  end
end
