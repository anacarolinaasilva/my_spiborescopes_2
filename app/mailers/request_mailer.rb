class RequestMailer < ApplicationMailer


  def lead_request(lead)
    emails = ["anacsilva.webdev@gmail.com","carygahm@gmail.com","mikewagner@spiborescopes.com" ,"marcello@onthemapmarketing.com"]
    @lead = lead
    mail(:to => emails, :subject => " A lead has been issued !")
  end

  def lead_update(lead)
    emails = ["anacsilva.webdev@gmail.com","carygahm@gmail.com","mikewagner@spiborescopes.com" ,"marcello@onthemapmarketing.com"]
    @lead = lead
    mail(:to => emails, :subject => " An Existing lead has been updated !")
  end

end
