class Record < ApplicationRecord
    mount_uploader :img,ImgUploader
    mount_uploaders :images ,ImgUploader
    validates :date, presence: true
    has_and_belongs_to_many :foods
end
