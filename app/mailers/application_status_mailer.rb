require 'digest/sha2'
class ApplicationStatusMailer < ApplicationMailer
    default "Message-ID"=>"#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@gmail.com"
    def application_accept(application)
      @application = application
      mail to: @application.email, subject: "GoJek: Application Accepted"
    end
    def application_reject(application)
        @application = application
        p @application.email
        mail to: @application.email, subject: "GoJek: Application Rejected"
    end
end
