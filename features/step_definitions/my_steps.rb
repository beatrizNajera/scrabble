Given(/^Voy a Inicio$/) do
  visit '/'
end

Then(/^Veo "(.*?)"$/) do |texto|
  last_response.body.should =~ /#{texto}/m
end

When(/^Ingreso "(.*?)"$/) do |palabra|
  fill_in("palabraIngresada", :with => palabra)
	click_button("Confirmar Palabra")
end

