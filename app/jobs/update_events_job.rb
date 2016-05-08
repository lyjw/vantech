class UpdateEventsJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    meetups = Meetup.all
    within_three_months = Date.today + 10.months

    meetups.each do |meetup|
      meetup.seed_events(within_three_months)
    end
  end
end
