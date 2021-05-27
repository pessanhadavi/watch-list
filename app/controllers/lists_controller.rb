class ListsController < ApplicationController
    before_action :set_list, only:[:show]
  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.find_by(list_id: params[:id])
  end

  def new
    @list = List.new
  end

  private

  def set_list
    @list = List.find(params[:id])
  end
end
