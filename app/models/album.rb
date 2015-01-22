class Album < ActiveRecord::Base
  belongs_to :user
  has_many :visits, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :hits, dependent: :destroy

  accepts_nested_attributes_for :photos, allow_destroy: true
  accepts_nested_attributes_for :visits, allow_destroy: true

  validates :photos, presence: {message: "You must attach at least one photo"}
  validates :name,
    presence: true,
    uniqueness: true
  validates :description, presence:true

  def total_hits_for_state(state)
    hits.where(region_code: state).count
  end
end
