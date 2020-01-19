require 'csv'
module DictionariesHelper

  # Returns if given entry's SAMPA is correct according to the Sampa associated to the dictionary
  # In case there is no such association, returns always true
  def sampa_correct?(entry)
    unless @dictionary.sampa.nil?
      all_phonemes = @dictionary.sampa.phonemes.split
      entry_phonemes = entry.sampa.split
      (entry_phonemes.uniq-all_phonemes).empty?
    else
      true
    end
  end
end
