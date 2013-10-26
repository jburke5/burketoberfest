class Event < ActiveRecord::Base
  
  PARTY_START_TIME=16
  
  def votes
    previous_winner = Array.new(Game.all.size+Game.first.id,DateTime.new(2013,10,26,PARTY_START_TIME,0,0,"-4"))
    current_winner = Array.new(Game.all.size+Game.first.id,DateTime.new(2013,10,26,PARTY_START_TIME,0,0,"-4"))
    log = "#{id} "#0
    points=0
    Score.all.sort{|x,y| x.created_at <=> y.created_at}.each do |score|
      if score.winner? #new winner!
        previous_winner[score.game_id] = current_winner[score.game_id]
        current_winner[score.game_id] = score.created_at.getlocal
        log += " currentwinner(#{score.event} #{current_winner[score.game_id].strftime("%l:%M")})"
      end
      log += " prevwinner(#{previous_winner[score.game_id].strftime("%l:%M")})"
      log += " eval(#{score.created_at.getlocal.strftime("%l:%M")})\n"
      
      points += score.points_since(previous_winner[score.game_id]) if score.event == id
      log+= " points(#{points}) from(#{previous_winner[score.game_id].strftime("%l:%M")})\n"
    end
    points
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
