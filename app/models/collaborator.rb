class Collaborator < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user

  validates :user_id, uniqueness: {scope: [:user_id, :wiki_id]}
end
