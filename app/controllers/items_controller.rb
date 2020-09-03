class ItemsController < ApplicationController

  include ApplicationHelper

  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

end
