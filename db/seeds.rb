require 'faker'

#Create Posts
  50.times do
    Post.create!(
      title: Faker::Lorem.sentence,
      body:  Faker::Lorem.paragraph
    )
  end
  
 # def create_original_post(title, post)
 #   if Post.exists?(title, post)
 #     puts "That post already exists"
 #   else
 #   Post.create!(title: title, body: post)
 #   end
 #  end
    
posts = Post.all
  
  #create Comments
  100.times do
    Comment.create!(
      post: posts.sample,
      body: Faker::Lorem.paragraph
      )
  end
puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"





# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
