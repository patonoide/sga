class Record < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :discussions, dependent: :destroy
  belongs_to :sector

  accepts_nested_attributes_for :discussions, allow_destroy: true
end
