class MoviesController < ApplicationController
  layout 'browse_paginated'

  def index
    @movies = Movie.all
  end

  def new
    # TODO
  end

  def create
    # TODO
  end

  def edit
    # TODO
  end

  def show
    @movies = Movie.find(2)
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end
end
