class LoginPage
  include Capybara::DSL

  def visit_login_page
    visit('https://account.postmarkapp.com/login')
  end

  def login(email, password)
    fill_in 'Username', with: email
    fill_in 'Password', with: password
    click_button 'Sign In'
  end

  def on_page?
    has_current_path?('https://account.postmarkapp.com/login')
  end

  def has_login_failed?
    has_text?('Your username or password is incorrect')
  end
end
