class DowngradesController < ApplicationController

  def create
    if current_user.premium?
      current_user.standard!
      current_user.wikis.update_all private: false
    end
    redirect_to root_path
    flash[:notice] = "Successfully Downgraded"
  end

end
