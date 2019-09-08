class RecipeImageValidator < ActiveModel::Validator 
    def validate (record)
        image_str_len = record.recipe_image.length
        image_file_ext = record.recipe_image[record.recipe_image - 4, image_str_len - 1]
        unless image_file_ext == '.jpg' || image_file_ext == '.jpeg' || image_file_ext == '.gif' || image_file_ext == '.png' || image_file_ext == '.svg'
            record.errors[:recipe_image] << 'Image must be a JPG, JPEG, GIF, PNG, or SVG format'
    end

end

class Recipe < ApplicationRecord
    include ActiveModel::Validator

    validates :title, presence: true
    validates :minutes, numericality: {greater_than_or_equal_to: 0, less_than: 1000 }
    validates_with RecipeImageValidator
end
