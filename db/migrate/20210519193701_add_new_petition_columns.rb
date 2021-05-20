# frozen_string_literal: true

# create columns for adding data from corresponding petition forms
class AddNewPetitionColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :petitions, :course_id, :string
    add_column :petitions, :audit_block, :string
    add_column :petitions, :course_taken, :string
    add_column :petitions, :course_substituted_for, :string
    add_column :petitions, :waived_requirement, :string
  end
end
