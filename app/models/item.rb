class Item < ActiveRecord::Base
  validates_presence_of :name, :description
  validates_unuqueness_of :name
end
