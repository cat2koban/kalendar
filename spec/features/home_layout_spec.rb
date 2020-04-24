require 'rails_helper'

RSpec.feature 'Home page', type: :feature do
  it do
    visit '/home'

    t = Time.new
    t = t.strftime('%B')
    expect(page).to have_text(t)
  end
end
