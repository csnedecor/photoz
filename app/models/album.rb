class Album < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :photos

  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :name,
    presence: true,
    uniqueness: true
  validates :description, presence:true
end
