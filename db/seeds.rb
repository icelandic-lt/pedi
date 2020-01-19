# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

seeded_users = [
    {
        name: 'admin',
        email: 'admin@example.com',
        password: 'admin_password',
        password_confirmation: 'admin_password',
        activated: true,
        activated_at: Time.zone.now
    }
]

seeded_sampa = {
  name: 'Default',
  phonemes: "a  ai  ai:  au  au:  a:  c  c_h  ei  ei:  f  h  i  i:  j  k  k_h  l  l_0  m  m_0  n  n_0  ou  ou:  p  p_h  r  r_0  s  t  t_h  u  u:  v  x  C  D  N  N_0  9  9Y  9Y:  9:  O  Oi  O:  E  E:  G  I  I:  J  J_0  Y  Yi  Y:  T".split.uniq.join(' ')
}

#
# Create models
#
seeded_users.each do |a_user|
  user = User.find_by(email: a_user[:email])
  if !user
    User.create!(name: a_user[:name],
                 email: a_user[:email],
                 password: a_user[:password],
                 password_digest: User.digest(a_user[:password]),
                 activated: a_user[:activated],
                 activated_at: a_user[:activated_at])
  end
end

sampa = Sampa.find_by(name: seeded_sampa[:name])
if !sampa
  sampa = Sampa.create!(name: seeded_sampa[:name],
                phonemes: seeded_sampa[:phonemes])
end

dict_name =  'TestDict'
a_dict = Dictionary.find_by(name: dict_name)
if !a_dict
  a_dict = Dictionary.create!(name: dict_name, sampa_id: sampa.id)
end

seeded_entries = CSV.read(File.dirname(__FILE__)+'/../sample-data/pron_dict_test.txt', headers: true, col_sep: "\t")

# XXX DS: move reading of CSV file into entry model
seeded_entries.each do |csv|
  an_entry = Entry.find_by_word(csv['word'])
  if (!an_entry)
    Entry.create!(word: csv['word'],
                  sampa: csv['sampa'],
                  comment: '',
                  user_id: User.first.id, 
                  dictionary_id: a_dict.id)
  end
end
