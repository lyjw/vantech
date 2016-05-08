class Event < ActiveRecord::Base # :nodoc:
  belongs_to :meetup

  def start_time
    self.time
  end

  def self.search(search)
    if search
      where(['title ILIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
