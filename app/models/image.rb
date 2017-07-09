# == Schema Information
#
# Table name: images
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  updated_at :datetime         not null
#

class Image < ApplicationRecord
  mount_uploader                    :asset, ImageUploader


  # Scopes
  # ==========================================================================================================
    default_scope                   { order(id: :ASC) }


  # Imageable (Polymorphic)
  # ==========================================================================================================
    belongs_to                      :imageable,
                                      polymorphic:    true

  # Validations
  # ==========================================================================================================
    validates                       :asset,
                                      presence:       true

    validates                       :imageable_type,
                                      presence:       true



  # Callbacks
  # ==========================================================================================================

  # Public methods
  # ==========================================================================================================
    def cl_asset
      self.asset.filename
    end

    def full_path
      ApplicationController.helpers.cloudinary_url(self.asset)
    end


  
  # Private methods
  # ==========================================================================================================
    private

end
