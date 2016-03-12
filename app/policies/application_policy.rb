class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    @user
  end

  def show?
    scope.where(:id => @wiki.id).exists?
  end

  def create?
    @user.role == "premium" || @user.role == "admin"
  end

  def new?
    @user.role == "premium" || @user.role == "admin"
  end

  def update?
    (@user.role == "premium" && @wiki.user == @user) || @user.role == "admin"
  end

  def edit?
    (@user.role == "premium" && @wiki.user == @user) || @user.role == "admin"
  end

  def destroy?
    (@user.role == "premium" && @wiki.user == @user) || @user.role == "admin"
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
