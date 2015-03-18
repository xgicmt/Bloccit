require 'faker'
Post.destroy_all
#User.destroy_all
Comment.destroy_all

def create_original_post(title, post)
  if Post.exists?(title: title)
    puts "That post already exists"  
  else
    Post.create!(title: title, body: post)
  end
end


#Create Posts
Post.create!(title:"Custom Title", body:"Made by a human")
create_original_post("Custom Title", "Made by a human")

  50.times do
    
    create_original_post(
      Faker::Lorem.sentence,
      Faker::Lorem.paragraph
    )
  end
    
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
