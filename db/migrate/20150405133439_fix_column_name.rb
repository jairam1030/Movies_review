class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :overall_averages, :overall_avg, :overall_average
  end
end
