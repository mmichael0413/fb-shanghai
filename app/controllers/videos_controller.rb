class VideosController < ApplicationController
  def index
    @videos = Video.all
  end
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.new(params[:video])
    
    if @video.save
      redirect_to videos_url
    else
      render action: "new"
    end
  end
  
  def show
    @video = Video.find(params[:id])
  end
  
  def edit
    @video = Video.find(params[:id])
  end
  
  def update
    @video = Video.find(params[:id])
    
    if @video.update_attributes(params[:video])
      redirect_to videos_url
    else
      render action: "edit"
    end
  end
  
  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    
    redirect_to videos_url
  end
  
  def upload_to_azure
    @video = Video.find(params[:id])
    @video.upload_it
    
    redirect_to :back
  end
end
