class ServersPage
  include Capybara::DSL

  SERVERS_PAGE_URL = 'https://account.postmarkapp.com/servers/'.freeze
  SERVERS_LIST_SELECTOR = '.servers-list'.freeze
  CREATE_SERVER_LINK_TEXT = 'Create server'.freeze
  CREATE_SERVER_LINK_SELECTOR = 'a.u-btn.u-btn--l'.freeze

  def visit_servers_page
    visit(SERVERS_PAGE_URL)
  end

  def on_servers_page?
    has_current_path?(SERVERS_PAGE_URL, url: true)
  end

  def server_list_present?
    has_selector?(SERVERS_LIST_SELECTOR)
  end

  def create_server_link_present?
    has_link?(CREATE_SERVER_LINK_TEXT, href: '/servers/new')
  end

  # Utilizes the constant for the selector for consistency and maintainability.
  def create_server
    find("#{CREATE_SERVER_LINK_SELECTOR}", text: CREATE_SERVER_LINK_TEXT).click
  end
end