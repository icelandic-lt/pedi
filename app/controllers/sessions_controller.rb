class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        helpers.log_in user
        params[:session][:remember_me] == '1' ? helpers.remember(user) : helpers.forget(user)
        #redirect_back_or user
        redirect_to root_url
      else
        message  = "Activation not yet done. "
        message += "An email with an activation link has been sent to you for activation to succeed"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    helpers.log_out if helpers.logged_in?
    redirect_to root_url
  end
end
