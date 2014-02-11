class WikisController < ApplicationController
  before_action :set_wiki, only: [:edit, :update, :destroy]

  def index
    
    @wikis = Wiki.visible_to(current_user)
  
  end

  def show

    @wiki = Wiki.friendly.find(params[:id])

    @created_by = @wiki.user || current_user
    
    if request.path != wiki_path(@wiki)
      redirect_to @wiki, status: :moved_permanently
    end
    
    authorize @wiki
    
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
  
  end

  def new
  
    @wiki = Wiki.new 
    
    @wiki.user_id = current_user.id
    @created_by = @wiki.user


  end

  def edit

    authorize @wiki
  
    @created_by = @wiki.user || current_user

    @currentCollaborators = []
    
    @wiki.collaborators.each do |c|
      @currentCollaborators << c.user.id
    end 
    
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
  
  end

  def create
  
    ## Custom code (collab_list) needed to support chosen multi-select dropdown with nested model

    collab_list = params[:wiki][:collab_list] || []
    params[:wiki].delete :collab_list
    
    @wiki = Wiki.new(wiki_params)
    @wiki.user_id = current_user.id
    @created_by = @wiki.user

    respond_to do |format|
      if @wiki.save
          removedCollaborators = @wiki.collaborators.all - @wiki.collaborators.where(user_id: collab_list)
          
          removedCollaborators.each do |r|
            r.delete
          end

          collab_list.each do |c|
            if (c != " " && c != "")
              @wiki.collaborators.find_or_create_by(user_id: c) 
            end
          end

        format.html { redirect_to @wiki, notice: 'Wiki was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wiki }

      else
        format.html { render action: 'new', notice: "Errors" }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
 
  end

  def update

    authorize @wiki

    @created_by = @wiki.user || current_user

    ## Custom code (collab_list) needed to support chosen multi-select dropdown with nested model

    collab_list = params[:wiki][:collab_list] || []
    params[:wiki].delete :collab_list

    removedCollaborators = @wiki.collaborators.all - @wiki.collaborators.where(user_id: collab_list)
    
    removedCollaborators.each do |r|
      r.delete
    end

    collab_list.each do |c|
      if (c != " " && c != "")
        @wiki.collaborators.find_or_create_by(user_id: c) 
      end
    end
    
    respond_to do |format|
      if @wiki.update(wiki_params)
        format.html { redirect_to @wiki, notice: "Wiki saved!" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy

    authorize @wiki
    @wiki.destroy
    
    respond_to do |format|
      format.html { redirect_to wikis_url }
      format.json { head :no_content }
    end

  end

  def should_generate_new_friendly_id? # For FriendlyID GEM 
    true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_params
      params.require(:wiki).permit(:title, :body, :private, :image, :user_id, collab_list: params[:collab_list])
    end

end