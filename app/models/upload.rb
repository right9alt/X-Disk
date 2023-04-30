class Upload < ApplicationRecord
  before_destroy :delete_fil

  belongs_to :user
  mount_uploader :file, Uploader
  validates :file, presence: true
  

  def decode_file_name
    File.basename(CGI::unescape(self.file.to_s)).gsub(/%.*/, '')
  end


  #removing after destroy file from database
  def delete_fil
    self.file.remove!
  end
end
