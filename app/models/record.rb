class Record < ActiveRecord::Base
  has_many :discussions, dependent: :destroy
  belongs_to :sector

  accepts_nested_attributes_for :discussions, allow_destroy: true
end
