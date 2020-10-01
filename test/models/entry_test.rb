require 'test_helper'

class EntryTest < ActiveSupport::TestCase

  test "validity of entry" do
    entry = entries('afstrakts')
    dict = entry.dictionary
    phonemes = dict.sampa.phonemes.split
    assert entry.sampa_correct?(phonemes)
    assert entry.valid?
  end

  test "Some attributes shall not be saved with leading/trailing whitespace" do
    entry = entries('afstrakts')
    spacy_sampa = " #{entry.sampa} "
    spacy_word = " #{entry.word} "
    spacy_comment = " #{entry.comment} "
    entry.sampa = spacy_sampa
    entry.word = spacy_word
    entry.comment = spacy_comment
    entry.save

    entry2 = entries('afstrakts')
    assert(entry2.sampa != spacy_sampa)
    assert(entry2.word != spacy_word)
    assert(entry2.comment != spacy_comment)
    assert(entry2.sampa == spacy_sampa.strip)
    assert(entry2.word == spacy_word.strip)
    assert(entry2.comment == spacy_comment.strip)
  end
end
