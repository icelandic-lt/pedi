class Dictionary < ApplicationRecord
  validates :name, presence: true
  validates :sampa, presence: true
  after_save :import_csv

  has_many :entries, dependent: :nullify
  belongs_to :sampa

  has_one_attached :import_data
  has_one_attached :export_data

  def import_csv
    unless self.attachment_changes['import_data'].nil?
      #unless self.import_data.nil?
      user_id = Current.user.id
      csv_entries = CSV.read(self.attachment_changes['import_data'].attachable, headers: true, col_sep: "\t")
      #puts "csv_entries: #{csv_entries.count}"
      csv_entries.each do |csv|
        #puts "{#{csv.inspect}}"
        entry = Entry.create!(word: csv['word'],
                        sampa: csv['sampa'],
                        comment: '',
                        user_id: user_id,
                        dictionary_id: self.id)
        puts entry.inspect if entry.id.nil?
      end
    else
      puts "No self.attachment_changes['import_data'] #{self.inspect}"
    end
  end
end
