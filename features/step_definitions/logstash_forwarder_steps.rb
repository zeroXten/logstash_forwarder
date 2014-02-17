Given(/^I have provisioned the following infrastructure:$/) do |specification|
  @infrastructure = Leibniz.build(specification)
end

Given(/^I have run Chef$/) do
  @infrastructure.destroy
  @infrastructure.converge
end

When(/^I look for "(.*?)"$/) do |arg1|
  @which_output = `which #{arg1}`.strip
end

Then(/^I should see "(.*?)"$/) do |arg1|
  @which_output.should == arg1
end
