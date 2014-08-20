every 1.day, :at => '05:00 am' do
  runner "Response.responses_waiting"
end

every 5.day, :at => '05:00 am' do
  runner "User.events_expired_waiting"
end