class Wiki < ActiveRecord::Base

  belongs_to :user

  accepts_nested_attributes_for :user

  scope :visible_to, lambda { |user| user ? scoped : where(private: false) }

end