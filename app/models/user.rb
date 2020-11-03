class User < ApplicationRecord
    before_save :downcase_email
    validates :name, presence: true, length: { maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, length: { maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    VALID_STUDENT_ID_REGEX = /\A[+-]?\d+\z/ 
    validates :student_id, presence: true, length: { minimum: 6, maximum: 6}, format: { with: VALID_STUDENT_ID_REGEX }, uniqueness: true
    validates :username, presence: true, length: { maximum: 255 }
    has_secure_password
    validates :password, length: { minimum: 6 }



    private
    
    # Converts an email to all lower-case
    def downcase_email
        self.email = email.downcase
    end
end
