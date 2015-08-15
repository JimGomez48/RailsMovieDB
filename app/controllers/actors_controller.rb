class ActorsController < ApplicationController
  layout :resolve_layout

  def index
    @actors = Actor.all.order(:last, :first, :dob).limit(100)
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
    # TODO
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end

  private
  def resolve_layout
    case action_name
      when 'index'    then 'browse_base'
      when 'new'      then 'form_base'
      when 'create'   then 'application'
      when 'edit'     then 'application'
      when 'show'     then 'show_base'
      when 'update'   then 'application'
      when 'destroy'  then 'application'
    end
  end
end
