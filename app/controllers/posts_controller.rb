class PostsController < ApplicationController
  before_filter :require_signed_in!, except: [:index, :show]
  
  def index
    @posts = Post.page(params[:page]).per(5)
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
    @post = current_user.posts.build(post_params)
    
    if @post.save
      flash[:notices] = ['Successfully created a new post!']
      redirect_to posts_url
    else
      flash.now[:errors] = @post.errors.full_messages
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
      flash[:notices] = ["Succesfully updated post (#{@post.title})!"]
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
