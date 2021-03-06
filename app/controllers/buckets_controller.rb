class BucketsController < ApplicationController
  def index
    @buckets = current_user.buckets
  end

  def show
    @bucket = current_user.buckets.find(params[:id])
  end

  def new
    @bucket = Bucket.new
  end

  def create
    @bucket = current_user.buckets.new(bucket_params)
    if @bucket.save
      redirect_to "/"
    else
      render :new
    end
  end

  def edit
    @bucket = current_user.buckets.find(params[:id])
  end

  def update
    @bucket = current_user.buckets.find(params[:id])
    if @bucket.update(bucket_params)
      redirect_to '/'
    else
      render :edit
    end
  end

  def destroy
    @bucket = current_user.buckets.find(params[:id])
    @bucket.destroy
    redirect_to '/'
  end

  private

  def bucket_params
    params.require(:bucket).permit(:name, :user_id)
  end
end
