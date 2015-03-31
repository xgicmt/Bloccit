require 'faker'
Post.destroy_all
User.destroy_all
Comment.destroy_all

  5.times do
    user = User.new(
      name:      Faker::Name.name,
      email:     Faker::Internet.email,
      password:  Faker::Lorem.characters(10)
      )
    user.skip_confirmation!
    user.save!
  end
  users = User.all

#create Topics
  15.times do
  Topic.create!(
    name:         Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
    )
  end
topics = Topic.all
#def create_original_post(user, title, post)
#  if Post.exists?(title: title)
#    puts "That post already exists"  
#  else
#    Post.create!(user: users.sample, title: title, body: post)
#  end
#end


#Create Posts
#Post.create!(title:"Custom Title", body:"Made by a human")
#create_original_post("Custom Title", "Made by a human")

  50.times do
    
    Post.create!(
      user: users.sample,
      topic: topics.sample,
      title: Faker::Lorem.sentence,
      body:  Faker::Lorem.paragraph
    )
  end
    
posts = Post.all
  
  #create Comments
  100.times do
    Comment.create!(
      user: users.sample,
      post: posts.sample,
      body: Faker::Lorem.paragraph
      )
  end

#create an admin user
admin = User.new(
  name:      'Admin User',
  email:     'admin@example.com',
  password:  'helloworld',
  role:      'admin'
  )
admin.skip_confirmation!
admin.save!
#New Moderator
moderator = User.new(
  name:      'Moderator User',
  email:     'moderator@example.com',
  password:  'helloworld',
  role:      'moderator'
  )
moderator.skip_confirmation!
moderator.save!
#new Member
member = User.new(
  name:      'Member User',
  email:     'member@example.com',
  password:  'helloworld',
  )
member.skip_confirmation!
member.save!





puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"





# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
