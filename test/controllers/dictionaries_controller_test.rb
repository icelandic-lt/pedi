require 'test_helper'

class DictionariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dictionary = dictionaries(:dict1)
    @user = users(:usera)
    @sampa = sampas(:sampa1)
    assert(@sampa != nil)
  end

  test "should get index" do
    get dictionaries_url
    assert_response :found
  end

  test "should get new" do
    get new_dictionary_url
    assert_response :success
  end

  test "should create dictionary" do
    assert_difference('Dictionary.count') do
      post dictionaries_url, params: { dictionary: { edited: @dictionary.edited, name: @dictionary.name, sampa_id: @sampa.id } }
    end

    assert_redirected_to dictionary_url(Dictionary.last)
  end

  test "should create dictionary with sampa" do
    dict_name = 'NewDictInTest'

    assert_difference('Dictionary.count') do
      post dictionaries_url, params: { dictionary: { edited: @dictionary.edited, name: dict_name, sampa_id: @sampa.id } }
    end
    assert_redirected_to dictionary_url(Dictionary.last)
    dict = Dictionary.find_by_name(dict_name)
    assert(dict != nil)
    assert(dict.sampa != nil)

  end

  test "should show dictionary" do
    get dictionary_url(@dictionary)
    assert_response :success
  end

  test "should get edit" do
    get edit_dictionary_url(@dictionary)
    assert_response :success
  end

  test "should update dictionary" do
    patch dictionary_url(@dictionary), params: { dictionary: { name: @dictionary.name } }
    assert_redirected_to dictionary_url(@dictionary)
  end

  test "should destroy dictionary" do
    assert_difference('Dictionary.count', -1) do
      delete dictionary_url(@dictionary)
    end

    assert_redirected_to dictionaries_url
  end
end
