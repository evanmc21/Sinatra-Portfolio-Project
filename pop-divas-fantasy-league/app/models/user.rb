class User < ActiveRecord::Base
  has_secure_password
  has_many :squads
  validates_presence_of :username, :email, :password
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  def slug
    self.username.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.find do |user|
      user.slug == slug
    end
  end


end
