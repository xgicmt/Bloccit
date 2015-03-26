class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  
  def self.tester
    order("posts.updated_at DESC")
  end
  
  #default_scope { order('created_at DESC')}
  scope :ordered_by_title, -> { order('title ASC')}
  scope :ordered_by_reverse_created_at, -> { order('created_at DESC')}
 # default_scope {order('created_at ASC')}
 # default_scope {order('title ASC')}
 # Post.find_by_user('Herman Becker IV')

end
