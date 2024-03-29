require 'spec_helper'
require_relative '../requests/email_service.rb'

TOKEN = ENV['POSTMARK_API_TOKEN']
EMAIL = ENV['POSTMARK_EMAIL']

describe EmailService do
  subject(:email_service) { EmailService.new(TOKEN) }

  describe '#send_email' do
    let(:email_options) do
      {
        from: EMAIL,
        to: EMAIL,
        subject: 'Hello from Postmark',
        html_body: '<strong>Hello</strong> dear Postmark user.',
        track_opens: true,
        message_stream: 'broadcast'
      }
    end

    it 'sends an email successfully' do
      response = email_service.send_email(**email_options)
      expect(response[:message]).to eq("OK")
      expect(response).to include(:message_id)
    end
  end
end