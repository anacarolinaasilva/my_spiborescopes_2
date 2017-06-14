require 'test_helper'
# assert_not : assert that an expression is not truthy ( expression evalution results in false or nil)
# valid?(context = nil) Link
# Runs all the validations within the specified context.
# Returns true if no errors are found, false otherwise.
# @user.valid? return true if user is valid, considers validation/value, false otherwise
# assert_not  @user.valid? affirm user is NOT valid, or use does not pass validation test

class UsersControllerTest < ActionDispatch::IntegrationTest

 def setup
   @user = User.new(name: "Example User", email: "user@example.com",
                    first_name: "Ana", last_name: "Silva",
                    password: "foobar", password_confirmation: "foobar")
 end

 test "should redirect index when not logged in" do
   get :index
   assert_redirected_to login_url
 end


 test "should be valid" do
   assert @user.valid?
 end

 #=== Presence Validation ====
 test "name should be present" do
   @user.name = "    "
   assert_not @user.valid?
 end

 test "email should be present" do
   @user.email = "    "
   assert_not @user.valid?
 end

 test "first name should be present" do
   @user.first_name = "    "
   assert_not @user.valid? #Expected @user to be nil or false
 end

 test "last name should be present" do
   @user.last_name = "    "
   assert_not @user.valid?
 end

 #Length validation
 test "name should not be too long" do
   @user.name = "a" * 51
   assert_not @user.valid?
 end

 test "email should not be too long" do
   @user.email = "a" * 244 + "@example.com"
   assert_not @user.valid?
 end

test "email validation should accept valid addresses" do
  valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                       first.last@foo.jp alice+bob@baz.cn]
   valid.addresses.each do |valid_address|
    @user.email = valid_addresses
    assert @user.valid?, "#{valid_address.inspect} should be valid"
   end
 end

  test "email validation should reject invalid addresses" do
    invalid_addreses = %w[user@example,com user_at_foo.org user.name@example.
                         foo@bar_bar.com foo@bar+baz.com]
    invalid_addreses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
   end
end

# === Uniqueness validation ===
test "email addresses should be unique" do
   duplicate_user = @user.dup
   duplicate_user.email = @user.email.upcase
   @user.save
   assert_not duplicate_user.valid?
end

test "email addresses should be saved as lower-case" do
  mixed_case_email = "Foo@ExAMPle.CoM"
  @user.email = mixed_case_email
  @user.save
  assert_equal mixed_case_email.downcase, @user.reload.email
end

# ==== Password Length Validation ====
test "password should have a minimum lenght" do
  @user.password =  @user.password_confirmation = "a" * 5
  assert_not @user.valid?
end

test "password should be present (nonblank)" do
  @user.password = @user.password_confirmation = " " * 6
  assert_not @user.valid?
end



end
