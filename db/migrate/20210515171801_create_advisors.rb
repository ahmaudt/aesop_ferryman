class CreateAdvisors < ActiveRecord::Migration[5.2]
  def change
    create_table :advisors do |t|
      t.string :first_name
      t.string :last_name
      t.string :uga_myid
      t.string :password_digest
    end
  end
end
