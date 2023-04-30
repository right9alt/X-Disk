class UploadsController < ApplicationController
  def create
    @upload = current_user.uploads.new(upload_params)
    if @upload.save
      redirect_to storage_path, notice: 'Файл успешно загружен.'
    else
      redirect_to storage_path, alert: @upload.errors.full_messages.join(', ')
    end
  end
  
  def destroy
    Upload.find(params[:id]).destroy
    redirect_to storage_path
  end

  private
  def upload_params
    params.require(:upload).permit(:file)
  end
 end
 