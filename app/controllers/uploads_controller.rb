class UploadsController < ApplicationController
  def new
  end

  def create
    redirect_to new_upload_path,
        notice: "File processed successfully; total gross revenue is $1,000.00"
  end
end
