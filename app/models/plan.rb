class Plan < ActiveRecord::Base
  has_one :subscription
end
