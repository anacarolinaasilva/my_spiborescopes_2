# Preview all emails at http://localhost:3000/rails/mailers/lead_notifier_mailer
class LeadNotifierMailerPreview < ActionMailer::Preview
  def sample_mail_preview
      LeadNotifierMailer.sample_email(Lead.first)
    end
end
