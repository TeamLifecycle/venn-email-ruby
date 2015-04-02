module Venn
  module Services
    class Mandrill

      def initialize(keys)
        @name = 'mandrill'
        @client = ::Mandrill::API.new keys.api_key
      end

    end
  end
end