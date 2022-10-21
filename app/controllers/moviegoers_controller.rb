class MoviegoersController < ApplicationController
  before_action :enforce_login, :set_current_user

  def show

  end

  def edit

  end

  def update
    if (@current_moviegoer.update moviegoer_params)
      flash[:notice] = "Profile for #{@current_moviegoer.full_name} successfully updated!"
      redirect_to profile_path
    end
  end

  private
  def moviegoer_params
    params.require(:current_moviegoer)
          .permit(:name, :surname, :email)
  end

end
