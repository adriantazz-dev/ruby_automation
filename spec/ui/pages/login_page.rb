class LoginPage
  include Capybara::DSL

  # PAGE URL
  LOGIN_PAGE_URL = 'https://account.postmarkapp.com/login'.freeze
  # SELECTORS
  USERNAME_FIELD = '#user_session_login'.freeze
  PASSWORD_FIELD = '#user_session_password'.freeze
  LOG_IN_BUTTON = 'button[name="button"][type="submit"]'.freeze


  def visit_login_page
    visit(LOGIN_PAGE_URL)
  end

  def login(username, password)
    find(USERNAME_FIELD).set(username)
    find(PASSWORD_FIELD).set(password)
    find(LOG_IN_BUTTON).click
  end

  def on_servers_page?
    has_current_path?('https://account.postmarkapp.com/servers', url: true)
  end

  def has_login_error?
    has_selector?('.message.error h3', text: 'Username or password is not correct')
  end
end
