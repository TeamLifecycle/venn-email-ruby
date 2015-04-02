module Venn
  class EmailClient

    def initialize(opts)
      @services = {}
      @venn_client = API.new opts[:api_key]
      @keys = @venn_client.get_keys
      configure_services @keys
    end

    def send(from, to, subject, message)
      sent_with = ''

      sorted_services.each do |service|
        begin
          sent_with = service.send from, to, subject, message
          break
        rescue Exception => e
          puts e.message
        end
      end

      sent_with
    end

    private

    def configure_services(opts)
      opts.each do |service, properties|
        email_provider = Services::Mandrill.new properties if service.to_sym == :mandrill
        email_provider = Services::SendGrid.new properties if service.to_sym == :sendgrid
        @services[service.to_sym] = email_provider
      end
    end

    def sorted_services
      ordered = []
      priority = @venn_client.get_priority

      priority.each do |service|
        ordered << @services[service.to_sym] if @services.keys.include? service.to_sym
      end

      ordered
    end

  end
end