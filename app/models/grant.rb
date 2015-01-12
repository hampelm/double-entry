class Grant < ActiveRecord::Base
  belongs_to :from, class_name: 'Organization'
  belongs_to :to, class_name: 'Organization'
end
