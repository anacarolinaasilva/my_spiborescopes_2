require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "contact_me" do
    # mail = MessageMailer.contact_me
    # assert_equal "Contact me", mail.subject
    # assert_equal ["to@example.org"], mail.to
    # assert_equal ["from@example.com"], mail.from
    # assert_match "Hi", mail.body.encoded

    message = Message.new  name: 'anna',
                           email: 'anacsilva.webdev@gmail.com',
                           phone: '7866131100',
                           company: 'On The Map',
                           body: 'hello, how are you doing?'

     email = MessageMailer.contact_me(message)


     #make sure exactly 1 email was queued.
     assert_emails 1 do
       email.deliver_now
     end

     #Assertions about the email
     assert_equal 'Message from www.spiborescopes.com', email.subject
     assert_equal ['anacsilva.webdev@gmail.com'], email.to
     assert_equal ['anacsilva.webdev@gmail.com'], email.from
     assert_match /hello, how are you doing?/, email.body.encoded


  end

end
