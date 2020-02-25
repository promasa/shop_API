class Evaluation < ApplicationRecord
  enum status: {Not: 0,  Bad: 1, Normal:2, Good:3} 
  belongs_to :item
  belongs_to :evaluated, class_name:"User" 
  belongs_to :evaluator, class_name:"User"
end
