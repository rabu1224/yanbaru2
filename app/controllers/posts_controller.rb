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
    edirect_to post, notice: "投稿しました"
  end

  def edit
  end

  def update
    @post.update!(post_params)
  # ***** 次を編集 *****
    redirect_to @post, notice: "更新しました"

  end

  def destroy
    # ***** 修正(@を追加しているので注意！) *****
    @post.destroy!
    # ***** 次を編集 *****
    redirect_to @post, alert: "削除しました"
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
