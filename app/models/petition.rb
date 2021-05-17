# frozen_string_literal: true

# class creates petition model
class Petition < ActiveRecord::Base
  belongs_to :student
  belongs_to :department
end