require 'tsv_parser'

class UploadsController < ApplicationController
  def new
  end

  def create
    unless params[:datafile]
      redirect_to(new_upload_path, alert: "You forgot to choose a file!")
      return
    end
    row_iterator = TsvParser.new(params[:datafile].read)
    upload = Datafile.new(row_iterator)
    if upload.save
      redirect_to new_upload_path,
          notice: "File processed successfully; " +
                  "total gross revenue is $#{upload.total_gross_revenue}"
    else
      redirect_to new_upload_path,
          alert: "Unable to save uploaded data: #{upload.error}"
    end
  end
end
