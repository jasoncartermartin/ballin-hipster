class Plan < ActiveRecord::Base
  #has_one :subscription
  has_many :subscriptions
end