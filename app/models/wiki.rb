class Wiki < ActiveRecord::Base

  belongs_to :user
  has_many :collaborators
  #has_and_belongs_to_many :collaborators, model: 'User', foreign_key:

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :collaborators

  scope :visible_to, lambda { |user| (user && user.premium?) ? scoped : where(private: false) }

end