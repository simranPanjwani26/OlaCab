class BookingPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
  def new?
    user.customer?
  end  

  def create?
    user.customer?
  end  

  def edit?
    user.customer?
  end  

  def update?
    user.customer? 
  end

  def index?
    user.customer?
  end  

  def destroy?
    user.customer?
  end  
end
