class Product < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  def self.name
    Product.user.profile.name
  end
end
