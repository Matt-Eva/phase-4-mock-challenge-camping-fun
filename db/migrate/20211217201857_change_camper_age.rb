class ChangeCamperAge < ActiveRecord::Migration[6.1]
  def change
    change_column :campers, :age, :integer
  end
end
