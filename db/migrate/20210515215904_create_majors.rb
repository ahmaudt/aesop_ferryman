# frozen_string_literal: true

# creates majors table to persist major model data into db
class CreateMajors < ActiveRecord::Migration[5.2]
  def change
    create_table :majors do |t|
      t.string :name
      t.integer :department_id
    end
  end
end
