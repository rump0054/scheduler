class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
			t.date :begin_date
			t.date :end_date
			
      t.timestamps
    end
  end
end
