class FavouritesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :find_micropost

  def create
    current_user.favorite(@micropost)

    render 'microposts/show'
  end

  def destroy
    current_user.unfavorite(@micropost)

    render 'microposts/show'
  end

  private

  def find_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end
end
