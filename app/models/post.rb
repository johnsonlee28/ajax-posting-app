class Post < ApplicationRecord
  validates_presence_of :content
  belongs_to :user

  has_many :likes, :dependent => :destroy
  has_many :liked_users, :through => :likes, :source => :user

  has_many :collections, :dependent => :destroy
  has_many :collection_members, :through => :collections, :source => :user

  def find_like(user)
    self.likes.where(:user_id => user.id).first
  end

  def find_collect(user)
    self.collections.where(:user_id => user.id).first
  end
end
