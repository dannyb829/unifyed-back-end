class ActivitiesController < ApplicationController
  def index
    activity = PublicActivity::Activity.order(created_at: :desc).where(owner_id: @current_user.followee_ids, owner_type: 'Account').limit(40)
    render json: activity, include: [:owner, :recipient, :trackable], status: :ok
  end

  def show
    activity = PublicActivity::Activity.where(owner_id: params[:id]).order(created_at: :desc).limit(30)
    render json: activity, include: [:owner, :recipient, :trackable], status: :ok
  end

end
