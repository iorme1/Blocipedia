class WikisController < ApplicationController
  before_action :find_wiki, only: [:show, :edit, :update, :destroy]

  def index
    @wikis = policy_scope(Wiki)
  end

  def show
  end

  def new
    @wiki = Wiki.new
    @users = User.all
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)

    if @wiki.save
      redirect_to wikis_path
      flash[:notice] = "Wiki successfully created!"
    else
      flash[:error] = "Wiki was not created. Please try again."
      render 'new'
    end
  end

  def edit
    @users = User.all
  end

  def update
    authorize @wiki

    if @wiki.update(wiki_params)
      redirect_to wiki_path(@wiki)
      flash[:notice] = "Wiki successfully updated!"
    else
      flash[:error] = "Wiki was not updated. Please try again."
      render 'edit'
    end
  end

  def destroy
    if @wiki.destroy
      redirect_to wikis_path
      flash[:notice] = "Wiki succesfully removed!"
    else
      redirect_to wikis_path
      flash[:error] = "Wiki was not removed. Please try again."
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

  def find_wiki
    @wiki = Wiki.find(params[:id])
  end

end
