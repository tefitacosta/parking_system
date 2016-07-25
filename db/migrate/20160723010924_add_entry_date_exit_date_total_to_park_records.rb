class AddEntryDateExitDateTotalToParkRecords < ActiveRecord::Migration
  def change
    add_column :park_records, :entry_date, :datetime
    add_column :park_records, :exit_date, :datetime
    add_column :park_records, :total, :float
  end
end
