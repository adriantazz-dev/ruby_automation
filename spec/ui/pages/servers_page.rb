class ServersPage
    include Capybara::DSL

    def visit_servers_page
        visit('https://account.postmarkapp.com/servers/')
      end

end