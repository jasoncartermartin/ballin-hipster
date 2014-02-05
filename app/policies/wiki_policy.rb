class WikiPolicy

  def initialize (user, wiki)
    @user = user
    @wiki = wiki
  end

  def update?
    edit?
  end

  def show?
    if @wiki.private
       (@user && @user.premium?) ? true : false
    else
     true
    end
  end

  def edit?
    if ( (@wiki.user_id == @user.id) || (@wiki.collaborators.find_by_user_id(@user.id)) ) 
      if @wiki.private
        (@user && @user.premium?) ? true : false
      else
        true
      end
    else
      false
    end
  end

  def destroy?
    if @user && (@wiki.user == @user)
      true
    else
      false
    end
  end

end