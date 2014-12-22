class PostsController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").all
  end

  def show
    @post = Post.find(params[:id])
  end
end
