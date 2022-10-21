class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    mg = Moviegoer.authenticate params[:moviegoer]
    if (mg)
      flash[:notice] = "#{mg.full_name} successfully logged in!"
      session[:current_mg_id] = mg.id
      redirect_to movies_path
    else
      flash[:warning] = 'Could not login, please try again'
      redirect_to login_path, status: 422
    end
  end

  def destroy
    session.delete :current_mg_id
    flash[:notice] = 'User logged out!'
    redirect_to movies_path
  end

end
