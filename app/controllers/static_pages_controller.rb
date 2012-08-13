class StaticPagesController < ApplicationController
  def home
  	@task = current_user.tasks.build if signed_in?
    @feed_items = current_user.feed.all if signed_in?
  end

  def about
  end
end
