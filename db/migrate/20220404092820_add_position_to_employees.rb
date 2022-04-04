class AddPositionToEmployees < ActiveRecord::Migration[7.0]
  # def change
  #   add_column :employees, :positions, :string
  # end

  def up
    execute <<-SQL
      ALTER TABLE employees
      ADD COLUMN position varchar;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE employees DROP COLUMN position;
    SQL
  end
end
