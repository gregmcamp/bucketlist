class UsersController < ApplicationController
  def index
    @users = User.all
    @buckets = current_user.buckets
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
