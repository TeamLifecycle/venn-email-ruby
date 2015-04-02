module Venn
  class EmailClient

    def initialize
      @services = {}
    end

    def configure_services(opts)
      opts.each do |service, properties|
        email_provider = Services::Mandrill.new properties if service.to_sym == :mandrill
        email_provider = Services::SendGrid.new properties if service.to_sym == :sendgrid
        @services[service.to_sym] = email_provider
      end
    end

  end
end