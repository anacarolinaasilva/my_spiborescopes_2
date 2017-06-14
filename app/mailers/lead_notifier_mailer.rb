class LeadNotifierMailer < ApplicationMailer

    def sample_email(lead)
     @lead = lead
     mail(to: @lead.email, subject: 'Email from the SPI Borescopes Team')
    end




end
