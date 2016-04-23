class Record < ActiveRecord::Base
  has_many :discussions, dependent: :destroy
  belongs_to :sector
end
