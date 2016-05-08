require 'faraday'
require 'json'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
# require 'faraday_middleware'

def total_events
  # url = "/HackerNestVan/events?photo-host=public&page=20"

  url = "/ajax/services/feed/find?v=1.0&q=Vancouver%20Tech%20"

  # conn = Faraday.new(url: 'https://api.meetup.com') do |faraday|
  conn = Faraday.new(url: 'https://ajax.googleapis.com') do |faraday|
    faraday.request  :url_encoded             # form-encode POST params
    faraday.response :logger                  # log requests to STDOUT
    faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
  end

  response = conn.get url     # GET http://sushi.com/nigiri/sake.json
  puts response.body
end
#
# def create_event_objects
#   event_objects.each do |event|
#     Event.create(title: event["name"], url: event.link, description: event.description, group_name: event.group.name, time: event.time)
#   end
# end

total_events
