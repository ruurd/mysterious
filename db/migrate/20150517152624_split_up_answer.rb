class SplitUpAnswer < ActiveRecord::Migration
  def up
    add_column :answers, :title, :string, nullable: true, default: nil, after: :text
    add_column :answers, :content, :string, nullable: true, default: nil, after: :title
    add_column :answers, :link, :string, nullable: true, default: nil, after: :content
    remove_column :answers, :text
  end

  def down
    add_column :answers, :text, :string, nullable: true, default: nil, before: :title
    remove_column :answers, :title
    remove_column :answers, :content
    remove_column :answers, :link
  end
end
