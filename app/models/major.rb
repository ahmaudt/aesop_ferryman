# frozen_string_literal: true

# class creates major model
class Major < ActiveRecord::Base
  belongs_to :department
  has_many :students
end
