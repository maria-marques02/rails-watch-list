class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new
    @movies = Movie.all
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to list_path(@list)
    else
      @movies = Movie.all
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
