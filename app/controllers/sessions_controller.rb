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
      flash[:errors] = @user.errors.full_messages
      render: new
    else
      sign_in!(@user)
      # redirect_to ...
    end
  end
  
  def destroy
    sign_out!
    # redirect_to ...
  end
  
end
