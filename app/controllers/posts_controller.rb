class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.order(id: :asc)
  end

  def show
    # ***** 修正 ****
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create!(post_params)
    redirect_to post
  end

  def edit
    # ***** 修正(@を追加しているので注意！) *****
    @post.update!(post_params)
    redirect_to @post
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to post
  end

  def destroy
    # ***** 修正(@を追加しているので注意！) *****
    @post.destroy!
    redirect_to @post
  end

  private

  # ***** 以下を追加 *****
  def set_post
    @post = Post.find(params[:id])
  end

  # ***** 以上を追加 *****

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
