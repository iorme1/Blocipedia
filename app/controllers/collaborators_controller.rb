class CollaboratorsController < ApplicationController
  before_action :get_current_wiki

  def new
    @collaborator = Collaborators.new
  end

  def create
    user = User.find_by(email: params[:email])
    @collaborator = Collaborator.new(wiki_id: @wiki.id, user: user)

    if @wiki.collaborating_users.include?(user)
      flash[:notice] = "User is allready collaborating"
      redirect_to wiki_path(@wiki)
    elsif user && @collaborator.save!
      flash[:notice] = "Collaborator succesfully added to this wiki"
      redirect_to wiki_path(@wiki)
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
