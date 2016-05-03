require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "the truth" do
   assert true
   end
 test "should not save user without email" do
   	user =User.new
   	assert_not user.save
   end
   #   test "should not save user without password" do
   # 	user=User.new
   # 	assert_not user.save
   # end

# test 'should require a password with minimum of 8 characters' do
# user = new_user(password: '12345')
# assert user.invalid?
# assert_equal 'is too short (minimum is 8 characters)'
# end


  # test "user email must not be empty" do
  #   user = User.new
  #   assert user.invalid?
  #   assert user.errors[:email].any?
  # end


    # test 'if Password length less than 8 character does not save' do
    # user = User.new(:email => "rohit@gmail.com")
     
    # assert user.invalid?
    # end
    test 'if Password length less than 8 character' do
    @user= User.new(email: 'abcde@gmail.com',password: 'test')
    if !@user.save
      assert_equal( "length less than 8 character", "length less than 8 character", "length less than 6 character" )
    end
  end



end
