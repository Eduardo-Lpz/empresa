class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.decimal :salary

      t.timestamps
    end
  end
end
