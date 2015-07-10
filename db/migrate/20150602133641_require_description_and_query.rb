class RequireDescriptionAndQuery < ActiveRecord::Migration
  def up
    change_column_null(:questions, :description, false)
    change_column_null(:questions, :query, false)
  end

  def down
    change_column_null(:questions, :description, true)
    change_column_null(:questions, :query, true)
  end
end
