class LoginPage
  include Capybara::DSL

  # SELECTORS
  LOG_IN_BUTTON = 'button[name="button"][type="submit"]'

  def visit_login_page
    visit('https://account.postmarkapp.com/login')
  end

  def login(email, password)
    fill_in 'Username', with: email
    fill_in 'Password', with: password
    find(LOG_IN_BUTTON).click
  end
end
