class Wiki < ActiveRecord::Base
  belongs_to :user

  has_many :collaborations
  has_many :users_as_collaborator, through: :collaborations, source: :user
end
