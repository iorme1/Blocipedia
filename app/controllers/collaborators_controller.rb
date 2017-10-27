class CollaboratorsController < ApplicationController
  before_action :get_current_wiki

  def new
  end

  def create
    @collaborator = @wiki.collaborators.new(wiki_id: @wiki.id, user_id: params[:format])
    @collaborator.save

    if @collaborator.save
      redirect_to wiki_path(@wiki)
      flash[:notice] = "Collaborator succesfully added to this wiki!"
    else
      flash[:error] = "Collaborator was not saved. Please try again."
      redirect_to wiki_path(@wiki)
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed from wiki!"
      redirect_to wiki_path(@wiki)
    else
      flash[:error] = "Collaborator was NOT removed succesfully. Please try again."
      redirect_to wiki_path(@wiki)
    end
  end

  private

  def get_current_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end

end
