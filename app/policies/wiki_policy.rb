class WikiPolicy

  def initialize (user, wiki)
    @user = user
    @wiki = wiki
  end

  # def update?
  #   if wiki.private == true
  #       if user.plan.name == "Premium"
  #         true
  #       else
  #         false
  #   else
  #     true
  #   end
  # end
  # end

  def show?
     if @wiki.private
         if @user && @user.premium?
           true
         else
           raise "Not authorized to show"
         end
     else
       true
     end
  end

  def edit?
     if @wiki.private
         if @user && @user.premium?
           true
         else
           raise "Not authorized to edit"
         end
     else
       true
     end
  end

  def destroy?
    if @user && (@wiki.user == @user)
      true
    else
      raise "Not authorized to delete"
    end
  end

end