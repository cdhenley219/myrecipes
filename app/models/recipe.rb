class RecipeImageValidator < ActiveModel::Validator 
    def validate (record)
        if (record.image_url.blank?) 
            return 
        end
        image_str_len = record.image_url.length
        image_file_ext = record.image_url[record.image_url - 4, image_str_len - 1]
        unless image_file_ext == '.jpg' || image_file_ext == '.jpeg' || image_file_ext == '.gif' || image_file_ext == '.png' || image_file_ext == '.svg'
            record.errors[:image_url] << 'Image must be a JPG, JPEG, GIF, PNG, or SVG format'
        end
    end

end

class Recipe < ApplicationRecord
    include ActiveModel::Validations

    belongs_to :user
    has_many :ingredients

    validates :title, presence: true
    validates_with RecipeImageValidator
end
