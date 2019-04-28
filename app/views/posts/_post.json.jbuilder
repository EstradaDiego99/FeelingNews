json.extract! post, :id, :texto, :favs, :hashtags, :shares, :tags, :concept, :concept_score, :keyword, :keyword_score, :category, :category_score, :entity, :entity_score, :created_at, :updated_at
json.url post_url(post, format: :json)
