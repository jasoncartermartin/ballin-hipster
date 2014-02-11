class Wiki < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  belongs_to :user
  has_many :collaborators
  
  validates :title, length: { minimum: 3 }, presence: true, uniqueness: true
  validates :body, length: { minimum: 20 }, presence: true

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :collaborators

  scope :visible_to, lambda { |user| (user && user.premium?) ? scoped : where(private: false) }

  def should_generate_new_friendly_id? # Overrides default behavior and always regenrates slug for new/edited titles
    true
  end

end