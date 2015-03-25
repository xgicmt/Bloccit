class Post < ActiveRecord::Base
  has_one :summary, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  
  default_scope { order('created_at DESC')}
end
