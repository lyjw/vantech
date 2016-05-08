class Meetup < ActiveRecord::Base
  has_many :events, dependent: :destroy

  validates :title, presence: true, uniqueness: { message: "This Meetup is already in your list." }

  def total_events
    conn = Faraday.new(url: 'https://api.meetup.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get url
    JSON.parse(response.body)
  end

  def seed_events
    two_months_later = Date.today + 2.months

    total_events.each do |event|
      event_time = event["time"]/1000

      if Time.at(event_time) < two_months_later
        Event.create(title: event["name"], url: event["link"], description: event["description"], group_name: event["group"]["name"], time: Time.at(event_time).localtime, meetup_id: id)
      end
    end
  end
end
