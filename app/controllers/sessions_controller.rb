class SessionsController < ApplicationController
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    
    if @user.nil?
      flash.now[:errors] = @user.errors.full_messages
      render :new
    else
      sign_in!(@user)
      redirect_to root_url
    end
  end
  
  def destroy
    sign_out!
    redirect_to new_admin_url
  end
  
end
