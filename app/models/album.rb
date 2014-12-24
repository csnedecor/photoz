class Album < ActiveRecord::Base
  belongs_to :user

  validates :name,
    presence: true,
    uniqueness: true
  validates :description, presence:true
end
