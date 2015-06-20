class Organization < ActiveRecord::Base
  has_many :grants_given, :class_name => 'Grant', :foreign_key => 'from_id'
  has_many :grants_received, :class_name => 'Grant', :foreign_key => 'to_id'

  validates :name,  presence: true
end
