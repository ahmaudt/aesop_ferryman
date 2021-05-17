# frozen_string_literal: true

# create students table to persist student model data
class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :uga_myid
      t.integer :major_id
      t.text :matriculation_term
      t.text :graduation_term
      t.integer :advisor_id
    end
  end
end
