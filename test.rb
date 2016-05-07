require 'faraday'
require 'json'

URL = "/HackerNestVan/events?photo-host=public&page=20&sig_id=204710864&sig=bd79ac9a7272dfe2a5a40a8a956b27ea0e1fdb85"

conn = Faraday.new(:url => 'https://api.meetup.com') do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  # faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

## GET ##

response = conn.get URL     # GET http://sushi.com/nigiri/sake.json
response_array = response.body.split("{\"")

# puts response.body
# response_array.split(", ")

final = JSON.parse(response.body)

puts final[0]
