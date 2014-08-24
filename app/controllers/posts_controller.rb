class PostsController < ApplicationController
  def index
    render :index
  end
  
  def show
    @post = Post.find(params[:id])
    render :show
  end
  
  def new
    @post = Post.new
    render :new
  end
  
  def create
    @post = Post.new(post_params)
    
    if @post.save
      # redirect_to ...
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    render :edit
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      # redirect_to ...
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    # redirect_to ...
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
