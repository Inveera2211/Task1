require 'test_helper'
include Warden::Test::Helpers
describe ArticlesController, 'Test Controller of article' do
  # include Devise::TestHelpers

 before do
  
    @user = User.create(:email => "user2@test.com", :password => "12345678", :password_confirmation => "12345678")
    #byebug
    @user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    sign_in @user

    @article = articles(:one)
    #@article = {title: 'Hello title' , text: 'Hello text' ,user_id: @user.id}
    
  end


class ArticlesControllerTest < ActionController::TestCase
  test "the truth" do
    assert true
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end
  test "index should render correct template and layout" do
  get :index
  assert_template :index
  assert_template layout: "layouts/application"
end

    test "should create article" do
    assert_difference('Article.count') do
    post :create, article: {title: 'Hirohit'}
    assert_redirected_to article_path(assigns(:article))
     
  end
  end

 test "should show article" do
get :show, id: articles(:one)
assert_response :success
end

test "should get new" do
      get :new
      assert_response  :success
    end


test "should update article" do
  title ='vijay articlee'
  put :update, :id => articles(:one), :article => {:title => 'vijay articlee'}
  assert_redirected_to article_path(assigns(:article))

end


test "successful edit article" do
  get :edit, :id => articles(:one)
   assert_template 'articles/edit'
    #assert_equal 'Article was successfully edited.', flash[:notice]
     
  end
   
  #   test "should destroy article" do
  #   assert_difference 'Article.count',-1 do 
  #     delete :destroy, :id => articles(:one)
  #     assert_response :redirect
  #     #assert_redirected_to articles_path
  #   end
  #   #assert_redirected_to articles_path
  # end
  test "should destroy article" do
    assert_difference 'Article.count',-1 do 
      delete :destroy, :id => @article.to_param
      assert_response :redirect
    end
    #assert_redirected_to articles_path
  end


      
   


end
