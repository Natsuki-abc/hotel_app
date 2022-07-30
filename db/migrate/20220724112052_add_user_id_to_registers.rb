class AddUserIdToRegisters < ActiveRecord::Migration[6.1]
  def change
    add_column :registers, :User_id, :integer
  end
end
