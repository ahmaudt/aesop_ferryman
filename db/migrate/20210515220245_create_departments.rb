# frozen_string_literal: true

# creates departments table for persisting department model data
class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name
    end
  end
end
