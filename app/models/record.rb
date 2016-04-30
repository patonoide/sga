class Record < ActiveRecord::Base

  has_many :record_users
  has_many :users, :through => :record_users, :class_name => 'User'

  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :record_users

  belongs_to :sector
  has_many :discussions, dependent: :destroy

  accepts_nested_attributes_for :discussions, reject_if: :all_blank,
                                              allow_destroy: true

end
