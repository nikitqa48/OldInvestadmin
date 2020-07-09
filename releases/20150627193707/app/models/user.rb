class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company

  validates :role, presence: true

  def self.roles_list
    [:admin, :manager]
  end

  def role? role
    self.role.to_sym == role.to_sym
  end

  def role_label
    I18n.t("activerecord.attributes.user.roles.#{self.role}") if self.role
  end
end
