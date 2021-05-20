class AddPermitOverrideColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :petitions, :permit_override, :string
  end
end
