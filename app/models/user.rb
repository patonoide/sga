class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  belongs_to :sector
  has_and_belongs_to_many :records

  def admin?
    self.role.name == 'Administrador'
  end

  def noe_member?; self.sector.short_name == 'NOE' end
  def nut_member?; self.sector.short_name == 'NUT' end
  def ndp_member?; self.sector.short_name == 'NDP' end
  def nut_member?; self.sector.short_name == 'NUT' end
  def nam_member?; self.sector.short_name == 'NAM' end
  def pc_member? ; self.sector.short_name == 'PC'  end

end
