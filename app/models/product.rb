class Product < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  def name
    try(:user).try(:profile).try(:name).where()
  end
end
