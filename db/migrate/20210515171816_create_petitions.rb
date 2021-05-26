# frozen_string_literal: true

# class creates petition table to persist petition model data into db
class CreatePetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :petitions do |t|
      t.string :petition_type
      t.string :content
      t.integer :advisor_id
      t.integer :student_id
      t.string :permit_override
      t.string :course_id
      t.string :audit_block
      t.string :course_taken
      t.string :course_substituted_for
      t.string :waived_requirement
      t.string :course_reg_num
      t.timestamps
    end
  end
end
