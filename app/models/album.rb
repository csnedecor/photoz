class Album < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :photos

  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :photos, presence: {message: "You must attach at least one photo"}
  validates :name,
    presence: true,
    uniqueness: true
  validates :description, presence:true
end
