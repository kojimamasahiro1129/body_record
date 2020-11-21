class Result < ApplicationRecord
    validates :name, presence: true
    validates :level, presence: true
    validates :mets , presence: true
    validates :sense, presence: true
    validates :date, presence: true
    validates :minutes, presence: true
    validates :weight, presence: true
end
