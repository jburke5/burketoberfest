class Event < ActiveRecord::Base
  
  PARTY_START_TIME=14
  
  def votes
    previous_winner = DateTime.new(2013,10,26,PARTY_START_TIME,0,0,"-4")
    current_winner = previous_winner
    total = 0
    Score.all.sort{|x,y| x.created_at <=> y.created_at}.each do |score|
      if score.winner? #new winner!
        previous_winner = current_winner
        current_winner = score.created_at.getlocal
      end
      points = score.points_since(previous_winner)
      total += points if points>0
    end
    total
  end
  
  def self.next_event_hour
    hour = Time.now.hour
    return hour+2 if hour%2==0
    hour+1
  end
  
  def self.find_all_by_next_event
    hour = (next_event_hour + 12) % 24
    Event.find_all_by_time(hour)
  end
end
