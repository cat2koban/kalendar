require 'rails_helper'

RSpec.feature 'Home page', type: :feature do
  it do
    visit '/'
    expect(page).to have_text(Time.new.strftime('%B'))
  end
end
