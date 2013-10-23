class Game < ActiveRecord::Base
  has_many :scores
  
  def long_string
     "#{name} / #{players} Players / #{duration} Minutes"
  end
end
