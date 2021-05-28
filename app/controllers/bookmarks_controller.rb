class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

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

  def destroy
    raise
    @list = List.find(params[:id])
    @bookmark = Bookmark.find_by(list_id: params[:id])
    @bookmark.destroy
    redirect_to list_path(@list)
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
