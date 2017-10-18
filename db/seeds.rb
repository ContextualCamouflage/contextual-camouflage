# Array of sample relationships
RELATIONSHIPS = %W(self relation)

User.create!(
  email: 'member@contextual.io',
  password: 'helloworld'
)

Installation.create!(
  locality: 'Oakland',
  active: false,
  active_at: '2017-01-01',
  latitude: 40.4420,
  longitude: -79.9625,
  display_name: 'Oakland'
)

Installation.create!(
  locality: 'Sewickley',
  active: true,
  active_at: '2017-01-01',
  latitude: 40.5775,
  longitude: -80.1503,
  display_name: 'Sewickley'
)

Installation.create!(
  locality: 'Pittsburgh',
  active: true,
  active_at: '2017-08-01',
  latitude: 40.4223,
  longitude: -79.9791,
  display_name: 'Downtown'
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
35.times do |n|
  Submission.create!(
    illness_id: illnesses.sample.id,
    cookie: "thisismycookie#{rand(10...1000000)}",
    relationship: RELATIONSHIPS.sample,
    ip_address: '23.25.80.129'
  )
end

35.times do |n|
  Submission.create!(
    illness_id: illnesses.sample.id,
    cookie: "thisismycookie#{rand(10...1000000)}",
    relationship: RELATIONSHIPS.sample,
    ip_address: '71.112.159.0'
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
