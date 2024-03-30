require 'spec_helper'
require_relative '../pages/login_page'
require_relative '../pages/servers_page'

RSpec.describe 'Servers feature', type: :system do
    let(:login_page) { LoginPage.new }
    let(:servers_page) { ServersPage.new }

    before(:each) do
        login_page.visit_login_page
        login_page.login(ENV['TEST_USER'], ENV['TEST_PASSWORD'])
      end

    it 'displays the servers page' do
        servers_page.visit_servers_page
        expect(servers_page).to be_on_servers_page
        expect(servers_page).to be_server_list_present
        expect(servers_page).to be_create_server_link_present
    end

    it 'creates a server successfully' do
        servers_page.visit_servers_page
        # TODO
    end
end
