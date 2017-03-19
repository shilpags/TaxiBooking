require File.dirname(__FILE__) + '/../test_helper'
require 'fareestimate_controller'

# Re-raise errors caught by the controller.
class FareestimateController; def rescue_action(e) raise e end; end

class FareestimateControllerTest < Test::Unit::TestCase
  def setup
    @controller = FareestimateController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
