Given(/^Voy a Inicio$/) do
  visit '/'
end

Then(/^Veo "(.*?)"$/) do |texto|
  last_response.body.should =~ /#{texto}/m
end
