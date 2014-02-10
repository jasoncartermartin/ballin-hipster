class Wiki < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  belongs_to :user
  has_many :collaborators
  #has_and_belongs_to_many :collaborators, model: 'User', foreign_key:

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :collaborators

  scope :visible_to, lambda { |user| (user && user.premium?) ? scoped : where(private: false) }

  def should_generate_new_friendly_id? # Overrides default behavior and always regenrates slug for new/edited titles
    true
  end

end