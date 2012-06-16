class MoviesController < ApplicationController

  helper_method :sort_column, :rating_checked, :selected_ratings
  
  attr_reader :selected_ratings


  def initialize
    super
    @all_ratings = Movie.all_ratings
    @selected_ratings = @all_ratings
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
#flash[:notice] = params[:ratings]
# we get a hash for params[:ratings], but @all_ratings is an array, therefore we cannot simply use ||=
    if params[:ratings] 
        @selected_ratings = params[:ratings].keys 
    end
    flash[:notice] = "selected ratings: #{@selected_ratings}"
    @movies = Movie.find(:all, :conditions => ["rating IN (?)", @selected_ratings], :order => params[:sort])
  end

  def rating_checked(rating)
    @selected_ratings.include?(rating)
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  def sort_column
    Movie.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

end
