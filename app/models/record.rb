class Record < ApplicationRecord
    mount_uploader :img,ImgUploader
    mount_uploaders :images ,ImgUploader
    mount_uploader :avatar, AvatarUploader
    validates :avatar, presence: true
    validates :weight, presence: true
    validates :bmi, presence: true
    validates :fat, presence: true
    validates :date, presence: true
    has_many :record_food
    has_many :foods, through: :record_food
end
