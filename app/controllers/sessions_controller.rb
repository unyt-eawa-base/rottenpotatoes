class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    mg = params[:moviegoer]
    @moviegoer = Moviegoer.find_by_email_and_password mg[:email], mg[:password]
    if (@moviegoer)
      flash[:notice] = "#{@moviegoer.full_name} successfully logged in!"
      redirect_to movies_path
    else
      flash[:warning] = 'Could not login, please try again'
      redirect_to login_path, status: 422
    end
  end

  def destroy
    #logout logic
  end

end
