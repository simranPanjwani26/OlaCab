class VehiclePolicy < ApplicationPolicy
 
  def index
    user.driver?
  end
  
  def new?
    user.driver?
  end

  def create?
    user.driver?
  end

  def update?
    user.driver?
  end 

  def edit?
    user.driver?
  end

  def destroy?
    user.driver?
  end
end
