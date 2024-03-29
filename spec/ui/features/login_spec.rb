require 'spec_helper'
require_relative '../pages/login_page'

# Environment variables with test credentials
TEST_USER = ENV['TEST_USER']
TEST_PASSWORD = ENV['TEST_PASSWORD']

RSpec.describe 'Login Feature', type: :system do
  let(:login_page) { LoginPage.new }

  # it 'successfully logs in with valid credentials' do
  #   login_page.visit_login_page
  #   login_page.login(TEST_USER, TEST_PASSWORD)

  #   expect(page).to have_current_path('https://account.postmarkapp.com/servers', url: true)
  # end

  it 'displays an error with invalid credentials' do
    login_page.visit_login_page
    login_page.login('wronguser', 'wrongpassword')

    expect(page).to have_selector('.message.error h3', text: 'Username or password is not correct')
  end
end

