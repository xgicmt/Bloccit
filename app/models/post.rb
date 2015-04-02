class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  
  default_scope { order('created_at DESC')}

validates :title, length: { minimum: 5 }, presence: true
validates :body, length: {minimum: 20 }, presence: true
validates :topic, presence: true
validates :user, presence: true

 # def self.paginate(per_page: 10, page: 0)
  #  limit(per_page).offset(page * per_page)
  #end
end
