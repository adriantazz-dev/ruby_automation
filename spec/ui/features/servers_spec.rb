require 'spec_helper'
require_relative '../pages/login_page'
require_relative '../pages/servers_page'

RSpec.describe 'Servers feature', type: :system do
    let(:servers_page) { ServersPage.new }

    it 'displays the servers page' do
        servers_page.visit_servers_page
        expect(page).to have_current_path('https://account.postmarkapp.com/servers/', url: true)
    end

    it 'displays the servers list' do
        servers_page.visit_servers_page
        expect(page).to have_selector('.servers-list')
    end
end
