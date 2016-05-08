class Meetup < ActiveRecord::Base

  def total_events
    conn = Faraday.new(url: 'https://api.meetup.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get url     # GET http://sushi.com/nigiri/sake.json
    JSON.parse(response.body)
  end

  def seed_events
    total_events.each do |event|
      Event.create(title: event["name"], url: event["link"], description: event["description"], group_name: event["group"]["name"], time: Time.at(event["time"]/1000).localtime, meetup_id: id)
    end
  end

end
