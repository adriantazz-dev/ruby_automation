require 'spec_helper'
require 'securerandom'
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
        servers_page.create_new_server
        expect(servers_page).to be_on_new_server_page
        random_server_name = "Test Server #{SecureRandom.alphanumeric(4)}"
        servers_page.type_new_server_name(random_server_name)
        servers_page.submit_create_server
        expect(servers_page).to be_server_created_successfully
    end
end
