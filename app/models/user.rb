class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :collaborations
  has_many :wikis
  has_many :wikis_as_collaborator, through: :collaborations, source: :wiki

  after_initialize { self.role ||= "standard" }

  scope :not_collaborator_yet, -> (wiki) do
      collaborators = Collaboration.where(wiki_id: wiki.id).pluck(:user_id)
      collaborators.any? ? User.where("id not in(?)", collaborators) : User.all
end

  ROLES = %w[standard premium admin]

end
