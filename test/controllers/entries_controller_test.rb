require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:bera)
    @dictionary = Dictionary.find_by_name('Dict1')
    @aNewEntry = Entry.new( word: 'bera2',
                            sampa: 'b E: r a 2',
                            comment: '',
                            user_id: User.find_by_name('NameAA'),
                            dictionary_id: @dictionary)
  end

  test "should get index" do
    get dictionary_entries_url(@dictionary)
    assert_response :success
  end

  test "should get new" do
    get new_dictionary_entry_url(@dictionary)
    assert_response :success
  end

  test "should create entry" do
    assert_difference('Entry.count') do
      post dictionary_entries_url(@dictionary),
            params: { entry: {
            word: @aNewEntry.word,
            sampa: @aNewEntry.sampa,
            comment: @aNewEntry.comment,
            user_id: User.find_by_name('NameAA').id,
            dictionary_id: @dictionary.id}
      }
    end

    assert_redirected_to dictionary_entry_url(@dictionary, Entry.last)
  end

  test "should show entry" do
    get dictionary_entry_url(@dictionary, @entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_dictionary_entry_url(@dictionary, @entry)
    assert_response :success
  end

  test "should update entry" do
    patch dictionary_entry_url(@dictionary, @entry), params: { entry: {
        word: 'bera2',
        sampa: 'b E: r a 2',
        comment: '',
        user_id: User.find_by_name('NameAA').id,
        dictionary_id: @dictionary.id}
    }
    assert_redirected_to dictionary_url(@dictionary)
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete dictionary_entry_url(@dictionary, @entry)
    end

    assert_redirected_to dictionary_entries_url
  end
end
