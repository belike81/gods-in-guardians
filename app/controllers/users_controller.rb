class UsersController < ApplicationController
  def index
    @type = params[:type] || "pvp"
    @users = User.all
    @keys = %w( super granade melee auto_rifle fusion hand_canon pulse_rifle rocket_launcher scout_rifle shotgun sniper side_arm sword )
  end
end
