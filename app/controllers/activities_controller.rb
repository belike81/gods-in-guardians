class ActivitiesController < ApplicationController
  before_filter :set_user

  def index
    @type = 'activities'
  end

  private

  def set_user
    @user = params[:user_id] ? User.find(params[:user_id]) : User.first
  end
end
