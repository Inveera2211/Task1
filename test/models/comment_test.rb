require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
   end

 test "should not save comment without body" do
 comment=Comment.new()
 assert_not comment.save
end
test "should report error" do
  # some_undefined_variable is not defined elsewhere in the test case
  some_undefined_variable
  assert true
end

end
