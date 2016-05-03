require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
	include Warden::Test::Helpers
   describe ArticlesController, 'Test Controller of article' do
  #include Devise::TestHelpers
	 before do
	 	
  	 #@user = User.create(:email => "test1@gmail.com", :password => "12345678", :password_confirmation => "12345678")
  	 #@user.confirm!
  	 @user = users(:user1) 
     sign_in @user
     #byebug
 #    @article = articles(:one)
 #    #@article = {title: 'Hello title' , text: 'Hello text' ,user_id: @user.id}
    
   end

    #  before(:each) do
    #  login_as(User.first, :scope => :user)
    # end 




  it "the truth" do
    assert true
  end

  it "should create comment"  do
 assert_difference 'Comment.count',1 do
 	post :create,article_id:Article.first, comment: {commenter:"test comment",body:"check"}
     assert_response :redirect
     end
      
    end
    #   test "should destroy comment" do
      
    #   assert_difference 'Comment.count',-1 do 
    #     delete :destroy, article_id:Article.last, :id => comments(:one)
    #     assert_response :redirect
    #   end
      
    # end 
 
   it "should destroy comment" do
      byebug
      assert_difference 'Comment.count',-1 do 
        delete :destroy, article_id:Article.last , :id => comments(:one).to_param
        assert_response :redirect
      end


 end
#delete :destroy, :id => articles(:one)
 # end
# test 'should create comment' do
#   @comment=@article.comments(comment_params)
#    assert_difference('Comment.count') do
#    post :create, comment: {title: 'New comment'}
#  end
#  assert_redirected_to assigns(:comment)
# test "associated comment should be destroyed" do
#     @article.save
#     @article.comments.create!(content: "Lorem ipsum")
#     assert_difference 'Comment.count', -1 do
#       @Article.destroy
#     end
#   end
# end
      
end
end