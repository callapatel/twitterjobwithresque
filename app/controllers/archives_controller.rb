class ArchivesController < ApplicationController

  def index

  end

  def create
    Resque.enqueue(ArchiveJob) #you can , and then add arguments. #this line writes data to the redis serve to call the perform method later.
    redirect_to root_path
  end




end
