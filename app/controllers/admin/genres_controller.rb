class Admin::GenresController < ApplicationController
  def index
   @genres = Genre.all
    @genre = Genre.new
  end

  def create
   @genre = Genre.new(genre_params)
   if @genre.save
     redirect_to admin_genres_path(@genre.id)
   else
     @genres = Genre.all
     render :index
   end
  end

  def edit
   @genre = Genre.find(params[:id])
  end

  def update
  end

 private
  def genre_params
    params.permit(:name)
  end

end
