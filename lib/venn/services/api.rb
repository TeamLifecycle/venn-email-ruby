module Venn
  class Api
    KEYS_ENDPOINT = "http://api.getvenn.io/v1/keys"
    PRIORITY_ENDPOINT = "http://api.getvenn.io/v1/priority"

    def initialize(opts)
      @api_key = opts[:api_key]
    end

    def get_keys
      opts = { :params => { :type => 'email' }, :headers => { 'venn-api-key' => @api_key } }
      RestClient.get Venn::Api::KEYS_ENDPOINT, opts
    end

    def get_priority
      opts = { :params => { :type => 'email' }, :headers => { 'venn-api-key' => @api_key } }
      RestClient.get Venn::Api::PRIORITY_ENDPOINT, opts
    end

  end
end