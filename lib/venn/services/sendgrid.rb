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

    end
  end
end