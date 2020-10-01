class SampasControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_as(users(:usera), password: 'AGeheim')
    @sampa = sampas(:sampa1)
    @sampas = sampas
  end

  test "should get index" do
    get sampas_url
    assert_response :success
  end

  test "should access all sampa attributes" do
    @sampas.each do |sampa|
      assert(sampa.name != nil)
      assert(sampa.phonemes != nil)
    end

  end
end