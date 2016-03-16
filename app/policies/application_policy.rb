class ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    false
  end

  def show?
    scope.where(:id => @wiki.id).exists?
  end

  def create?
    @user
  end

  def new?
    @user
  end

  def update?
    @user
  end

  def edit?
    @user
  end

  def destroy?
    @user
  end

  def scope
    Pundit.policy_scope!(user, @wiki.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
