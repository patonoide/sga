class Status < ActiveRecord::Base
  has_many :record_users
end
