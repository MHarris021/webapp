require 'test_helper'

class ScriptsControllerTest < ActionController::TestCase

  test "start" do
    login
    post :start, {scriptname:"average", username:"jill"}
    assert_nil flash[:error]
    assert_redirected_to :action => :lastrun
  end

  def login
    def @controller.auth
      log_in(User.new)
    end
  end
end
