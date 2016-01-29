class SessionsController < ApplicationController
  
  def new
    if current_admin.nil?
     #  Do nothing
      else
        redirect_to users_path, notice: 'Logged in already!'
    end
  end

  def create
    admin = Admin.find_by_email(params[:email])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      #redirect_to root_url, notice: 'Logged in!'
      redirect_to users_path, notice: 'Logged in!'
    else
      flash.now[:alert] = "Try to log in again, maybe your password or email was wrong"
      render :new
    end
  end
  def destroy
    session[:admin_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end

def authorize
    if current_admin.nil?
      redirect_to login_url, alert: "Not authorized! Please log in."
    else
      redirect_to users_path, alert: "Redirected to Members List"
     end
 end

