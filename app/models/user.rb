class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable, :rememberable

  mount_uploader :avatar, AvatarUploader
  belongs_to :department,  optional: true
  has_and_belongs_to_many :events
  scope :all_except, ->(exception) { where.not(id: exception) }

  def is_admin?
    self.role == "admin"
  end
end
