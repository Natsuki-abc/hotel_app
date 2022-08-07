class RenameUserIdColumnToRegisters < ActiveRecord::Migration[6.1]
  def change
    rename_column :registers, :User_id, :user_id
  end
end
