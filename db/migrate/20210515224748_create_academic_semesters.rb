# frozen_string_literal: true

# creates academic semester table
class CreateAcademicSemesters < ActiveRecord::Migration[5.2]
  def change
    create_table :academic_semesters do |t|
      t.string :term
      t.integer :year
    end
  end
end
