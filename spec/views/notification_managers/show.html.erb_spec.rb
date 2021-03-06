require 'rails_helper'

RSpec.describe "notification_managers/show", type: :view do
  before(:each) do
    @notification_manager = assign(:notification_manager, NotificationManager.create!(
      :title => "Title",
      :event => nil,
      :notice => nil,
      :sector => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
