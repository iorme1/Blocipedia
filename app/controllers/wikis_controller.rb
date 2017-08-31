class WikisController < ApplicationController
  before_action :find_wiki, only: [:show, :edit, :update, :destroy]

  def index
    @wikis = Wiki.all
  end

  def show
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)

    if @wiki.save
      redirect_to wikis_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    
    if @wiki.update(wiki_params)
      redirect_to wiki_path(@wiki)
    else
      render 'edit'
    end
  end

  def destroy
    @wiki.destroy
    redirect_to wikis_path
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

  def find_wiki
    @wiki = Wiki.find(params[:id])
  end



end
