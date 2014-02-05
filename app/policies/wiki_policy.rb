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
    if @wiki.private
      (@user && @user.premium?) ? true : false
    else
      true
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