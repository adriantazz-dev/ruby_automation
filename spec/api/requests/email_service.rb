require 'postmark'

class EmailService
  def initialize(api_token)
    @client = Postmark::ApiClient.new(api_token)
  end

  def send_email(from:, to:, subject:, html_body:, track_opens: true, message_stream: 'broadcast')
    @client.deliver(
      from: from,
      to: to,
      subject: subject,
      html_body: html_body,
      track_opens: track_opens,
      message_stream: message_stream
    )
  end
end


