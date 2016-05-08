class Event < ActiveRecord::Base # :nodoc:
  belongs_to :meetup

  def start_time
    self.time
  end
end
