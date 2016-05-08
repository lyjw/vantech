namespace :vantech do
  desc "Update Meetup events daily"
  task :update_events do
    UpdateEventsJob.perform_now
  end
end
