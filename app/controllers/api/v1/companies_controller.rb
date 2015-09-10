class Api::V1::CompaniesController < Api::V1::ApiController
  def index
    if params[:page].nil?
      @companies = Company.all.order(:name)
    else
      if params[:results_per_page]
        per_page = params[:results_per_page].to_i
      else
        per_page = DEFAULT_PER_PAGE
      end
      @companies = Company.all.order(:name).paginate(page: params[:page], per_page: per_page)
      generate_pagination(@companies , Company.count, per_page)
    end
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
    @company = Company.find(params[:id])
    @movies = @company.movies
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end
end
