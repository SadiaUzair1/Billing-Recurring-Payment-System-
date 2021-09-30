# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
<<<<<<< HEAD

=======
>>>>>>> d74b9ee27d0944e63077250fbb777bb883d34ae0
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end

  def admin?
   user.user_type == 'admin'
  end

  def buyer?
    user.user_type == 'buyer'
 end
end
