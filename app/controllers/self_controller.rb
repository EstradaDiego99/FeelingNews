class SelfController < ApplicationController
  def show
    @posts = Post.all
  end

  def followers
    @posts = Post.all
  end

  def statistics
    @posts = Post.all
    @totalFav = 0
    @totalRt = 0
    @sumaFav = 0
    @sumaRt = 0
    @averageRt = 0
    @averageFav = 0
    @maxValueFav = 0
    @maxValueRt = 0
  end

  def predictions
    @posts = Post.all
  end
end
