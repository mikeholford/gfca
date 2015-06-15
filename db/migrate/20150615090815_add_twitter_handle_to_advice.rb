class AddTwitterHandleToAdvice < ActiveRecord::Migration
  def change
    add_column :advices, :twitter_handle, :string
  end
end
