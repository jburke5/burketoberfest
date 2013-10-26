class Game < ActiveRecord::Base
  has_many :scores
  
  def long_string
     "#{name}"
  end
end
