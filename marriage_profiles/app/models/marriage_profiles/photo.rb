module MarriageProfiles
  class Photo < ApplicationRecord
    belongs_to :profile, class_name: 'MarriageProfiles::Profile'
    mount_uploader :image, PhotoUploader
    
    validates :image, presence: true
  end
end 