module MarriageProfiles
  class Profile < ApplicationRecord
    belongs_to :user, class_name: 'User'
    mount_uploader :photo, PhotoUploader
    mount_uploader :photo2, PhotoUploader
    mount_uploader :photo3, PhotoUploader
    mount_uploader :resume, PhotoUploader
    mount_uploader :cover_image, PhotoUploader
    has_many :photos, dependent: :destroy
    accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: :all_blank

    enum :gender, [:male, :female, :other]
    
    # Define the attribute type explicitly
    attribute :profile_type, :string, default: "marriage"
    enum :profile_type, { generic: "generic", professional: "professional", marriage: "marriage" }

    # Common validations for all profile types
    validates :profile_type, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :bio, presence: true, length: { minimum: 50, maximum: 1000 }
    validates :name, presence: true
    validates :passcode, presence: true, if: :passcode_enabled?
    validates :passcode, length: { minimum: 4 }, if: :passcode_enabled?

    # Profile type specific validations
    with_options if: :is_marriage_profile? do |profile|
      profile.validates :date_of_birth, presence: true
      profile.validates :gender, presence: true
      profile.validates :religion, presence: true
      profile.validates :occupation, presence: true
      profile.validates :education, presence: true
      profile.validates :location, presence: true
      profile.validates :height, presence: true
      profile.validates :marital_status, presence: true
    end

    with_options if: :is_professional_profile? do |profile|
      profile.validates :title, presence: true
      profile.validates :skills, presence: true
      profile.validates :education, presence: true
      profile.validates :experience, presence: true
      profile.validates :contact_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    end

    with_options if: :is_generic_profile? do |profile|
      profile.validates :location, presence: true
    end

    def self.search(query)
      where("first_name ILIKE :query OR last_name ILIKE :query OR location ILIKE :query OR occupation ILIKE :query", 
            query: "%#{query}%")
    end

    def age
      return nil unless date_of_birth
      now = Time.current.to_date
      now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
    end

    def name
      return "#{first_name} #{last_name}" if first_name.present? && last_name.present?
      super
    end

    def is_marriage_profile?
      profile_type == 'marriage'
    end

    def is_professional_profile?
      profile_type == 'professional'
    end

    def is_generic_profile?
      profile_type == 'generic'
    end

    def passcode_enabled?
      self[:passcode_enabled] == true
    end

    def valid_passcode?(entered_passcode)
      return true unless passcode_enabled?
      passcode == entered_passcode
    end
  end
end 