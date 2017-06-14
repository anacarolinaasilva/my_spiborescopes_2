require 'test_helper'

class MicropostTest < ActiveSupport::TestCase



def setup
  @setup    =  users(:Michael)
 @micropost =  Micropost.new(user.id: @user.id)
end



test "should be valid" do
  assert @micropost.valid?
end


end
