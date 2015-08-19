class User < ActiveRecord::Base
  has_many :reviews

  def as_json(options={})
    super(:only => [:last, :first, :username, :email])
  end
end
