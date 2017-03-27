class AppearancesController < ApplicationController

  def index
    @appearances = Appearance.all
  end

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.valid?
      @appearance.save
      redirect_to @appearance.episode
    else
      flash[:error] = @appearance.errors.full_messages[0]
      redirect_to new_appearance_path
    end
  end

  def edit
    @appearance = Appearance.find(params[:id])
  end

  def update
    appearance = Appearance.find(params[:id])
    if appearance.valid?
      appearance.update(appearance_params)
      redirect_to appearances_path
    else
      flash[:error] = appearance.errors.full_messages[0]
      redirect_to edit_appearance_path(appearance)
    end
  end
  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :user_id)
  end
end
