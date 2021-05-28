class BookmarksController < ApplicationController
  before_action :set_list
  before_action
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(comment: bookmark_params[:comment], movie: find_movie)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie)
  end

  def find_movie
    Movie.find(bookmark_params[:movie])
  end
  
end
