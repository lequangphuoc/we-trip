class Attachment < ActiveRecord::Base
  belongs_to :trip, dependent: :destroy

  mount_uploader :path, AttachmentUploader
  validates_presence_of :trip_id, :path
end
