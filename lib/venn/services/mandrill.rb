module Venn
  module Services
    class Mandrill

      def initialize(keys)
        @name = 'mandrill'
        @client = ::Mandrill::API.new keys.api_key
      end

      def send(from, to, subject, message)
        message = {
          'subject' => subject,
          'to': [{ 'email' => to}],
          'from_email' => from,
          'html' => message
        }
        @client.messages.send message

        return @name
      end

    end
  end
end