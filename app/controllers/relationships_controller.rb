class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.new
    relationship.follower_id = current_user.id
    relationship.followed_id = params[:user_id]
    relationship.save
    redirect_back fallback_location: root_path
  end
  
  def show_follower
    @user = User.find(params[:user_id])
    @follower = @user.followers
    @followed = @user.followeds
    @follows = Relationship.all
  end
  
  def show_followed
    @user = User.find(params[:user_id])
    @follower = @user.followers
    @followed = @user.followeds
    @follows = Relationship.all
  end
  
  def destroy
    relationship = Relationship.find_by(follower_id: current_user.id, followed_id: params[:user_id])
    relationship.destroy
    redirect_back fallback_location: root_path
  end
end
