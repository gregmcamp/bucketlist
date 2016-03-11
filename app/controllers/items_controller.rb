class ItemsController < ApplicationController
  before_action :bucket

  def index
    @items = @bucket.items
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = @bucket.items.new(item_params)
    if @item.save
      redirect_to "/"
    else
      render :new
    end
  end

  def edit
    @item = @bucket.items.find(params[:id])
  end

  def update
    @item = @bucket.items.find(params[:id])
    if @item.update(item_params)
      redirect_to "/"
    else
      render :edit
    end
  end

  def destroy
    @item = @bucket.items.find(params[:id])
    @item.destroy
    redirect_to "/"
  end

  private
  def item_params
    params.require(:item).permit(:name, :description)
  end

  def bucket
    @bucket = Bucket.find(params[:bucket_id])
  end
end
