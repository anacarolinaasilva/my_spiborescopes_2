# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview
   def lead_request_preview
      RequestMailer.lead_request(Lead.first)
    end
end
