class HomeController < ApplicationController
  def index
    @buckets = current_user.buckets
  end
end
