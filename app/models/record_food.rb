class RecordFood < ApplicationRecord
    belongs_to :record
    belongs_to :food
    self.table_name="foods_records"
end
