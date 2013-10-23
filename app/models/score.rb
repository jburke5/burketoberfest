class Score < ActiveRecord::Base
  belongs_to :game
  
  def time
    created_at.getlocal.strftime("%l:%M %P")
  end
end
