require 'postmark'

class EmailService
  def initialize(api_token)
    @client = Postmark::ApiClient.new(api_token)
  end

  # This method prepares and returns email options with some default values
  def prepare_email_options(to:, subject:, html_body:, from: ENV['POSTMARK_EMAIL'], track_opens: true, message_stream: 'broadcast')
    {
      from: from,
      to: to,
      subject: subject,
      html_body: html_body,
      track_opens: track_opens,
      message_stream: message_stream
    }
  end

  def send_email(email_options)
    @client.deliver(email_options)
  end
end
