class ServersPage
  include Capybara::DSL

  SERVERS_PAGE_URL = 'https://account.postmarkapp.com/servers/'.freeze
  SERVERS_LIST_SELECTOR = '.servers-list'.freeze
  CREATE_SERVER_LINK_TEXT = 'Create server'.freeze
  CREATE_SERVER_LINK_SELECTOR = 'a.u-btn.u-btn--l'.freeze
  NAME_YOUR_SERVER_FIELD = '#server_name'.freeze
  SUBMIT_CREATE_SERVER_BUTTON = "input[type='submit'][name='commit'][value='Create server']".freeze

  def visit_servers_page
    visit(SERVERS_PAGE_URL)
  end

  def on_servers_page?
    has_current_path?(SERVERS_PAGE_URL, url: true)
  end

  def on_new_server_page?
    has_current_path?("#{SERVERS_PAGE_URL}new", url: true)
  end

  def server_list_present?
    has_selector?(SERVERS_LIST_SELECTOR)
  end

  def create_server_link_present?
    has_link?(CREATE_SERVER_LINK_TEXT, href: '/servers/new')
  end

  def create_new_server
    find("#{CREATE_SERVER_LINK_SELECTOR}", text: CREATE_SERVER_LINK_TEXT).click
  end

  def type_new_server_name(server_name)
    find(NAME_YOUR_SERVER_FIELD).set(server_name)
  end

  def submit_create_server
    find(SUBMIT_CREATE_SERVER_BUTTON).click
  end

  def server_created_successfully?
    # A better approach would be to catch the server id and add it to the URL
    has_current_path?(/#{Regexp.escape(SERVERS_PAGE_URL)}\d+\/streams/, url: true)
  end

end