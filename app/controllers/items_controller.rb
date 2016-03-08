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
      redirect_to bucket_path(@bucket)
    else
      render :new
    end
  end

  def edit
  end

  private
  def item_params
    params.require(:item).permit(:name, :description)
  end

  def bucket
    @bucket = Bucket.find(params[:bucket_id])
  end
end
