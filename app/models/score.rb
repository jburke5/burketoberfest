class Score < ActiveRecord::Base
  belongs_to :game
  
  WIN_FACTOR=5
  LOSE_FACTOR=1
  
  def time
    created_at.getlocal.strftime("%l:%M %P")
  end
  
  def minutes_since(last_time)
    (created_at.getlocal-last_time).to_i/60
  end
  
  def points_since(last_time)
    return minutes_since(last_time)*WIN_FACTOR if rank==1
    minutes_since(last_time)*LOSE_FACTOR
  end
  
  def event_name
    Event.find(event).name
  end
  
  def result
    return "Won" if rank==1
    "Lost"
  end
end
