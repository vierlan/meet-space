require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  def setup
    @controller = ApplicationController.new
  end

  test "configure_permitted_parameters permits additional fields for sign up" do
    assert_difference 'devise_parameter_sanitizer.permitted(:sign_up).count', 3 do
      @controller.send(:configure_permitted_parameters)
    end
  end

  test "configure_permitted_parameters permits additional fields for account update" do
    assert_difference 'devise_parameter_sanitizer.permitted(:account_update).count', 3 do
      @controller.send(:configure_permitted_parameters)
    end
  end
end
