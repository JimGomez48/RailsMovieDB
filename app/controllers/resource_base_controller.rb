class ResourceBaseController < ApplicationController
  layout :resolve_layout

  RESULTS_PER_PAGE = 20

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