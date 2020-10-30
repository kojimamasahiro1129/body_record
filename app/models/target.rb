class Target < ApplicationRecord
    mount_uploaders :img ,ImgUploader
end
