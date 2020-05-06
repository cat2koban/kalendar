def login(user, options = {})
  if options[:by_capybara]
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  else
    post login_path, params: { session: { email: user.email, password: user.password } }
  end
end
