class MovieCompany < ActiveRecord::Base
  belongs_to :movie
  belongs_to :company
end
