class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan

  accepts_nested_attributes_for :plan
end