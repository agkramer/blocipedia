class CollaborationsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:collaboration][:user_id])
    @collaboration = Collaboration.create(user_id: @user.id, wiki_id: @wiki.id)

    if @collaboration.save
      flash[:notice] = "#{@user.email} added as collaborator."
      redirect_to @wiki
    else
      flash.now[:alert] = "Error adding collaborator to wiki, please try again."
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaboration.find(params[:id])

    if @collaboration.destroy
      flash[:notice] = "#{@collaboration.user.email} removed as collaborator."
      redirect_to @wiki
    else
      flash.now[:alert] = "Error removing collaborator to wiki, please try again."
    end
  end
end
