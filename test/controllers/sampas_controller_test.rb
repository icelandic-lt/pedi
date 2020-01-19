class SampasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sampa = sampas(:sampa1)
  end

  test "should get index" do
    get sampas_url
    assert_response :success
  end
end