class LeaderboardsController < ApplicationController
  def index
  	@leaders = User.all.order(score: :desc)
  end
end
