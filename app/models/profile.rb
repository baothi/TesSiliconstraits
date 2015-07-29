class Profile < ActiveRecord::Base
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar
  validates :name, length: { minimum: 4}, :presence => { message: "thap nhat 4 ky tu" } 
  def crop_avatar
    avatar.recreate_versions! if crop_x.present?
  end
end
