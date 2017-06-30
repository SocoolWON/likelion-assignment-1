class PostsController < ApplicationController
  before_action :set_post, only: [:destroy, :edit, :update]
  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      redirect_to new_post_path 
    end
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      redirect_to edit_post_path 
    end
  end
  
  def destroy
    if @post.delete
      redirect_to root_path
    else
      flash[:message] = "Failed to delete"
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end
