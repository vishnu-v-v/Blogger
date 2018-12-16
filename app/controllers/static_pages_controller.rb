class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @feed_items = Micropost.favorited_by(params[:favorited]) if params[:favorited].present?
    end
  end

  def help
  end
  
  def about
  end

  def contact
  end
end
