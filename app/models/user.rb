class User < ApplicationRecord
    attr_accessor :remember_token, :activation_token
    before_save :downcase_email
    before_create :create_activation_token
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
    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
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

    # Creates an activation token that hopefully works (:
    def create_activation_token
        self.activation_token = User.new_token
        self.activation_digest = User.digest(activation_token)
    end

    

end
