class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

    scope :privately, -> { where(public: false).order('created_at DESC') }
    scope :visible_to, -> (user) { user ? all : where(public: true) } 
    scope :publicly, -> { where(public: true).order('created_at DESC') }
  def privately_viewable
   Topic.privately
  end
  def publicly_viewable
    Topic.publicly
  end
end
