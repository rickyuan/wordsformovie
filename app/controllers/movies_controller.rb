class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:movie])
    if @movie.save
      redirect_to index_path, :flash => { :notice => "Movie created successful." }
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
