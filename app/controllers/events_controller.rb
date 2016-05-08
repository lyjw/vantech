class EventsController < ApplicationController # :nodoc:
  def index
    @events = Event.all
  end

  def show
    # show
  end

  private

  # Method to gather events parsed with JSON via API link
  def total_events
    url = "/HackerNestVan/events?photo-host=public&page=20&sig_id=204710864&sig=bd79ac9a7272dfe2a5a40a8a956b27ea0e1fdb85"

    conn = Faraday.new(url: 'https://api.meetup.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get url     # GET http://sushi.com/nigiri/sake.json
    JSON.parse(response.body)
  end

  def create_event_objects
    total_events.each do |event|
      Event.create(title: event["name"], url: event["link"], description: event["description"], group_name: event["group"]["name"], time: Time.at(event["time"]/1000))
    end
  end
end
