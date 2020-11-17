class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index

  end

  def new
    @item = Item.new
  end

  def create
    # @item = Item.new(item_params)
  end

  private

  

end
