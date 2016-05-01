class Record < ActiveRecord::Base

  has_many :records_users
  has_many :users, through: :records_users, class_name: 'User'

  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :records_users

  belongs_to :sector
  has_many :discussions, dependent: :destroy

  accepts_nested_attributes_for :discussions, reject_if: :all_blank,
                                              allow_destroy: true

end
