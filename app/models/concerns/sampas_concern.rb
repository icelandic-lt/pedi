module SampasConcern
  class SampaValidator < ActiveModel::Validator
    def validate(record)
      unless record.phonemes.nil?
        record.phonemes.split.each do |phoneme|
          if phoneme !~ /^[a-z:_09]{1,3}$/i
            record.errors.add(:phonemes, 'contain invalid characters')
          end
        end
      end
    end
  end
end

