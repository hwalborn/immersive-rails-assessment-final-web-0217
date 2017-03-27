class AppearancesController < ApplicationController

  def index
    @appearances = Appearance.all
  end

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end
  end

  def edit
    @appearance = Appearance.find(params[:id])
  end

  def update
    appearance = Appearance.find(params[:id])
    if appearance.valid?
      appearance.user = User.find(session[:user_id])
      appearance.save
      redirect_to episodes_path
    else
      redirect_to edit_appearance_path(appearance)
    end
  end
  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end

end
