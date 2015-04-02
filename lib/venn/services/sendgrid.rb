module Venn
  module Services
    class SendGrid

      def initialize(keys)
        @name = 'sendgrid'
        @client = ::SendGrid::Client.new do |c|
          c.api_user = keys.api_user
          c.api_key = keys.api_key
        end
      end

      def send(from, to, subject, message)
        mail = SendGrid::Mail.new do |m|
          m.to = to
          m.from = from
          m.subject = subject
          m.html = message
        end
        @client.send mail

        @name
      end

    end
  end
end