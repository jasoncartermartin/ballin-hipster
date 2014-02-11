class CollaboratorsController < ApplicationController
  def create
    @user = User.find(params[:collaborator][:user_id])
    @wiki = Wiki.find(params[:collaborator][:wiki_id])

    @collaborator = Collaborator.new(wiki: @wiki, user: @user)

    respond_to do |format|
      if @collaborator.save
        format.html { redirect_to @wiki, notice: 'Collaborator was successfully added.' }
        format.json { render action: 'show', status: :created, location: @wiki }
      else
        format.html { render action: 'new' }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    respond_to do |format|
      if @collaborator.delete
        format.html { redirect_to request.headers["Referer"], notice: 'Collaborator was successfully deleted.' }
        format.json { render action: 'show', status: :created, location: @wiki }
      else
        format.html { render action: 'new' }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end
end
