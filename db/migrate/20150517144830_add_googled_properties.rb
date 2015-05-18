class AddGoogledProperties < ActiveRecord::Migration
  def up
    add_column :questions, :googled_at, :datetime, nullable: true, default: nil
    add_column :answers, :googled, :boolean, default: false
  end

  def down
    remove_column :questions, :googled_at
    remove_column :answers, :googled
  end
end
