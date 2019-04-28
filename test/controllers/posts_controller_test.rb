require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { category: @post.category, category_score: @post.category_score, concept: @post.concept, concept_score: @post.concept_score, entity: @post.entity, entity_score: @post.entity_score, favs: @post.favs, hashtags: @post.hashtags, keyword: @post.keyword, keyword_score: @post.keyword_score, shares: @post.shares, tags: @post.tags, texto: @post.texto } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { category: @post.category, category_score: @post.category_score, concept: @post.concept, concept_score: @post.concept_score, entity: @post.entity, entity_score: @post.entity_score, favs: @post.favs, hashtags: @post.hashtags, keyword: @post.keyword, keyword_score: @post.keyword_score, shares: @post.shares, tags: @post.tags, texto: @post.texto } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
