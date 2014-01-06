class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable, :confirmable
      #   :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  after_destroy :ensure_an_admin_remains
  attr_accessible :name, :password_digest
  attr_accessible :password, :password_confirmation
  validates :name, presence: true, uniqueness: true
  has_secure_password
  has_many :authorizations
  validates :name, :email, :presence => true
 
def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end


  def self.create_from_hash!(hash)
    create(:name => hash['user_info']['name'])
  end
 
  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end

    def add_provider(auth_hash)
      # Check if the provider already exists, so we don't add it twice
      unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
        Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      end
    end



# def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
#   user = User.where(:provider => auth.provider, :uid => auth.uid).first
#   unless user
#     user = User.create(name:auth.extra.raw_info.name,
#                          provider:auth.provider,
#                          uid:auth.uid,
#                          email:auth.info.email,
#                          password:Devise.friendly_token[0,20]
#                          )
#   end
#   user
# end

# def self.new_with_session(params, session)
#     super.tap do |user|
#       if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
#         user.email = data["email"]
#       end
#     end
#   end
  
end
