class User < ApplicationRecord
    before_action :logged_in_user, only [:index, :edit, :update, :destroy]
    attr_accessor :remember_token
    before_save :downcase_email
    has_many :vms, dependent: :destroy
    validates :name, presence: true, length: { maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, length: { maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    VALID_STUDENT_ID_REGEX = /\A[+-]?\d+\z/ 
    validates :student_id, presence: true, length: { minimum: 6, maximum: 6}, format: { with: VALID_STUDENT_ID_REGEX }, uniqueness: true
    validates :username, presence: true, length: { maximum: 255 }
    has_secure_password
    validates :password, length: { minimum: 6 }

    # Returns the hash digest of a string
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # generates and stores a remember_token for remembering a User
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true if a user is authenticated
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Forgets a User
    def forget
        update_attribute(:remember_digest, nil)
    end

    private
    
    # Converts an email to all lowercase
    def downcase_email
        self.email = email.downcase
    end

    # Before Filters

    def correct_user
        @user = User.find_by(params[:id])
        redirect_to root_url unless current_user?(@user)
    end

end
