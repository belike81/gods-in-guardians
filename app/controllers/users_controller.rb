class UsersController < ApplicationController
  def index
    @type = params[:type] || "pvp"
    @users = User.all
  end
end
