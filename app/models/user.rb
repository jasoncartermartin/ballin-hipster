class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :subscription
  has_one :plan, through: :subscription
  has_many :wikis

  accepts_nested_attributes_for :subscription, :plan

  def premium?
    if self.subscription.plan.name == "Premium"
      true
    else
      false
    end
  end

  def name?
    return self.name
  end
  
end
