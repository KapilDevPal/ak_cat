module BxBlockGod
  class God < ApplicationRecord
    self.table_name = "bx_block_god_gods"
    
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    
    has_one_attached :image
    
    has_many :bhajans, class_name: 'BxBlockGod::Bhajan', foreign_key: 'god_id', dependent: :destroy
    
    def self.ransackable_attributes(auth_object = nil)
      %w[id name sanskrit_name description significance festivals temples mantras image_url created_at updated_at]
    end

    def self.ransackable_associations(auth_object = nil)
      []
    end
  end
end 