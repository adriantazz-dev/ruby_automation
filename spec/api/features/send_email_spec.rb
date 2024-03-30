require 'spec_helper'
require_relative '../services/email_service'
require_relative '../support/api_response_assertions'

EMAIL = ENV['POSTMARK_EMAIL']

RSpec.describe EmailService do
  include APIResponseAssertions

  subject(:email_service) { described_class.new(ENV['POSTMARK_API_TOKEN']) }

  describe '#send_email' do

    it 'sends an email successfully' do

      # Prepare the email options
      email_options = email_service.prepare_email_options(
        to: EMAIL,
        subject: 'Hello from Postmark',
        html_body: '<strong>Hello</strong> dear Postmark user.'
      )
      response = email_service.send_email(email_options)
      expect_successful_response(response)
    end

  end
end
