class Entry < ApplicationRecord
  belongs_to :dictionary
  belongs_to :user, default: -> { Current.user }

  scope :ordered, -> { order(word: :asc) }

  validates :word, presence: true
end
