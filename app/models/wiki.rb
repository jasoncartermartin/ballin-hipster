class Wiki < ActiveRecord::Base

  belongs_to :user
  has_many :collaborators

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :collaborators

  scope :visible_to, lambda { |user| user ? scoped : where(private: false) }

end