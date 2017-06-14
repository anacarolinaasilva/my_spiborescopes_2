require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

    test 'name, email and body are required by law' do
      msg = Message.new

      assert msg.respond_to?(:name), 'does not respond to :name'
      assert msg.respond_to?(:email), 'does not respond to :email'
      assert msg.respond_to?(:phone), 'does not respond to :phone'
      assert msg.respond_to?(:company), 'does not respond to :company'
      assert msg.respond_to?(:body), 'does not respond to :body'

      refute msg.valid?, 'Blank Mesage should be invalid'

      #assert_match(exp, act, msg = nil) public
      #Fails unless exp is =~ act.
      assert_match /blank/, msg.errors[:name].to_s
      assert_match /blank/, msg.errors[:email].to_s
      assert_match /blank/, msg.errors[:phone].to_s
      assert_match /blank/, msg.errors[:company].to_s
      assert_match /blank/, msg.errors[:body].to_s

      # attrs = {
      #     name: 'stephen',
      #     email: 'stephen@example.org',
      #     phone: '7866131100',
      #     company: 'kthnxbai',
      #     body:'message test'
      #  }
      #  msg = Message.new attrs
      #  assert msg.valid?, 'should be valid'

  end
end
