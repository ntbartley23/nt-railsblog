class DropSamples < ActiveRecord::Migration
  def change
  	drop_table :samples
  end
end
