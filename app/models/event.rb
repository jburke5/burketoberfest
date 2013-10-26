class Event < ActiveRecord::Base
  def votes
    last = DateTime.new(2013,10,26,12,0,0,"-4")
    total = 0
    Score.find_all_by_event(id).sort{|x,y| x.created_at <=> y.created_at}.each do |score|
      total += score.points_since(last)
      last= score.created_at.getlocal
    end
    total
  end
end
