class UserPolicy  
    # def  initialize(current_user, user)
    #     # @current_user = current_user
    #     @user = user
    # end
    def edit?
        user.admin?
    end

    def destroy?
        user.admin?
    end
    
    def update?
       user.admin?
    end

    def index?
        user.admin?
    end
end