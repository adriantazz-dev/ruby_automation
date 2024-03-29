require 'spec_helper'
require_relative '../pages/login_page'

RSpec.describe 'Login Feature', type: :system do
  let(:login_page) { LoginPage.new }

  it 'successfully logs in with valid credentials' do
    login_page.visit_login_page
    login_page.login('test@example.com', 'password')

    # Replace the following line with a check for a successful login,
    # such as checking for the presence of a logout button or a specific
    # success message.
    expect(page).to have_content('Success Message')
  end

  it 'displays an error with invalid credentials' do
    login_page.visit_login_page
    login_page.login('wrong@example.com', 'wrongpassword')

    expect(login_page.has_login_failed?).to be true
  end
end

