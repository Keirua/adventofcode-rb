# Helper for days
class Day
  def self.pad(day)
    if day.to_i < 10
      '0' + day
    else
      day
    end
  end
end
