# Array of sample relationships
RELATIONSHIPS = %W(self relation)

User.create!(
  email: 'member@contextual.io',
  password: 'helloworld'
)

Installation.create!(
  locality: 'Oakland',
  active: true,
  active_at: '2017-01-01',
  latitude: 37.8044,
  longitude: 122.2711,
)

Installation.create!(
  locality: 'Sewickley',
  active: true,
  active_at: '2017-01-01',
  latitude: 40.5365,
  longitude: 80.1844,
)

# Parsing illnesses csv to seed db
csv_text = File.read(Rails.root.join('lib', 'seeds', 'illnesses.csv'))
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  i = Illness.new
  i.name = row['name']
  i.body = row['body']
  i.save!
end

illnesses = Illness.all

# Creating random submissions/anecdotes/researches
20.times do |n|
  ip = "96.236.157.31"
  Submission.create!(
    illness_id: illnesses.sample.id,
    cookie: "thisismycookie#{rand(10...1000000)}",
    relationship: RELATIONSHIPS.sample,
    ip_address: ip,
    locality: "Sewickley",
    zip_code: "15222"
  )
end

submissions = Submission.all

20.times do |n|
  Anecdote.create!(
    body: Faker::Hipster.sentence,
    submission_id: submissions.sample.id
  )
end

20.times do |n|
  Research.create!(
    gender: Faker::Demographic.sex,
    age: Faker::Number.between(18, 90),
    race: Faker::Demographic.race,
    occupation: Faker::Job.title,
    submission_id: submissions.sample.id
  )
end

puts "#{User.count} users created"
puts "#{Submission.count} submissions created"
puts "#{Illness.count} illnesses created"
puts "#{Anecdote.count} anecdotes created"
puts "#{Research.count} researches created"
