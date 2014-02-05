class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  

  # GET /wikis
  # GET /wikis.json
  def index
    @wikis = Wiki.visible_to(current_user)
  end

  # GET /wikis/1
  # GET /wikis/1.json
  def show
    authorize @wiki
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
  end

  # GET /wikis/new
  def new
    @wiki = Wiki.new
  end

  # GET /wikis/1/edit
  def edit
    authorize @wiki
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
  end

  # POST /wikis
  # POST /wikis.json
  def create
    
    collab_list = params[:wiki][:collab_list] || []
    params[:wiki].delete :collab_list
    
    @wiki = Wiki.new(wiki_params)
    @wiki.user_id = current_user.id
    
    message = ""

    respond_to do |format|
      if @wiki.save
          removedCollaborators = @wiki.collaborators.all - @wiki.collaborators.where(user_id: collab_list)
          
          removedCollaborators.each do |r|
            message << r.user.email + " has been removed as a collaborator, "
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
        format.html { render action: 'new' }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wikis/1
  # PATCH/PUT /wikis/1.json
  def update
    authorize @wiki
    collab_list = params[:wiki][:collab_list] || []
    params[:wiki].delete :collab_list

    message = ""

    removedCollaborators = @wiki.collaborators.all - @wiki.collaborators.where(user_id: collab_list)
    
    removedCollaborators.each do |r|
      message << r.user.email + " has been removed as a collaborator, "
      r.delete
    end

    collab_list.each do |c|
      if (c != " " && c != "")
        @wiki.collaborators.find_or_create_by(user_id: c) 
      end
    end
    
    respond_to do |format|
      if @wiki.update(wiki_params)
        format.html { redirect_to @wiki, notice: "Record saved! #{message}" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wikis/1
  # DELETE /wikis/1.json
  def destroy
    authorize @wiki
    @wiki.destroy
    respond_to do |format|
      format.html { redirect_to wikis_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_params
      params.require(:wiki).permit(:title, :body, :private, :image, :user_id, collab_list: params[:collab_list])
    end
end
