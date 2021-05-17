# frozen_string_literal: true

# creates join table to enable term code and semester lookups
class CreateTermCodesAndSemesters < ActiveRecord::Migration[5.2]
  def change
    create_join_table :academic_term_codes, :academic_semesters, table_name: :term_codes_and_semesters
  end
end
