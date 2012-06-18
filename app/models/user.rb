class User < ActiveRecord::Base
  has_many :cycles
	rolify
  attr_accessible :provider, :uid, :name, :email

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
      user.add_role :regular
    end
  end

  def admin?
    self.has_role? :admin
  end

end

