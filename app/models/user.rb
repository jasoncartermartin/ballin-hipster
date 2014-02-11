class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :subscription
  has_many :wikis

  accepts_nested_attributes_for :subscription

  def premium?
    if self.subscription && self.subscription.plan.name == "Premium"
      true
    else
      false
    end
  end

  def plan
    self.subscription.plan
  end

  def name?
    return self.name
  end
  
end
