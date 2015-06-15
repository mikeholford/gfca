class AddAdviceFields < ActiveRecord::Migration
  def change
    add_column :advices, :vote_up, :integer, default: 0
    add_column :advices, :vote_down, :integer, default: 0
    add_column :advices, :vote_total, :integer, default: 0
  end
end
