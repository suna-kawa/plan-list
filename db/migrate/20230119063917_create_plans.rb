class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.string :memo
      t.boolean :checkbox

      t.timestamps
    end
  end
end
