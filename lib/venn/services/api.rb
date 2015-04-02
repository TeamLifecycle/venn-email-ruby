module Venn
  module Services
    class Api

      KEYS_ENDPOINT = "http://api.getvenn.io/v1/keys"
      PRIORITY_ENDPOINT = "http://api.getvenn.io/v1/priority"

      def initialize(opts)
        @api_key = opts[:api_key]
      end

      def get_keys
        opts = { :params => { :type => 'email' }, 'venn-api-key' => @api_key }
        res = RestClient.get Venn::Services::Api::KEYS_ENDPOINT, opts
        MultiJson.load res, :symbolize_keys => true
      end

      def get_priority
        opts = { :params => { :type => 'email' }, 'venn-api-key' => @api_key }
        res = RestClient.get Venn::Services::Api::PRIORITY_ENDPOINT, opts
        MultiJson.load res, :symbolize_keys => true
      end

    end
  end
end