class CollaboratorsController < ApplicationController
  before_action :get_current_wiki

  def new
    @collaborator = Collaborators.new
  end

  def create
    @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])

    if @collaborator.save!
      redirect_to wiki_path(@wiki)
      flash[:notice] = "Collaborator succesfully added to this wiki"
    else
      flash[:notice] = "Collaborator was not saved. Please try again."
      redirect_to edit_wiki_path
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @collaborator.destroy
    flash[:notice] = "Collaborator was removed from wiki."
    redirect_to wiki_path
  end

  private

  def get_current_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
