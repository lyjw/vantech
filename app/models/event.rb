class Event < ActiveRecord::Base # :nodoc:
  belongs_to :meetup

  validates :title, uniqueness: { scope: :time }

  def start_time
    self.time
  end
end
