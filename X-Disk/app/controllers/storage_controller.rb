class StorageController < ApplicationController
 def index
  @upload = Upload.new
  @uploads = Upload.where(user_id: current_user.id).order(created_at: :desc)
 end
end
