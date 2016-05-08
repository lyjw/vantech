module EventsHelper

  def event_objects
    url = "/HackerNestVan/events?photo-host=public&page=20&sig_id=204710864&sig=bd79ac9a7272dfe2a5a40a8a956b27ea0e1fdb85"

    conn = Faraday.new(url: 'https://api.meetup.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    ## GET ##

    response = conn.get url     # GET http://sushi.com/nigiri/sake.json
    total_events = JSON.parse(response.body)

    puts total_events
    # method returns an array of JSON parsed events
  end

  def create_event_objects
    event_objects.each do |event|
      Event.create(title: event.name, url: event.link, description: event.description, group_name: event.group.name, time: event.time)
    end
  end

end
