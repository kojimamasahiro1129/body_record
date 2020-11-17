class Food < ApplicationRecord
#   has_and_belongs_to_many :records
   has_many :record_food
   has_many :records, through: :record_food
end
