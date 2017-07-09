# == Schema Information
#
# Table name: products
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  # SkuSetMemberships > Skus
  # ==========================================================================================================
    has_many                        :skus,
                                      inverse_of:     :product,
                                      dependent:      :destroy,
                                      autosave:       true

    accepts_nested_attributes_for   :skus,
                                      allow_destroy:  true,
                                      reject_if:      -> (attributes) {
                                                        attributes['identifier'].blank?
                                                      } 



  # Validations - Required
  # ==========================================================================================================
    
    # Attributes
    # --------------------------------------------------------------------------------------------------------
      validates                       :name,
                                        presence:       true,
                                        format:         { with: /[0-9a-zA-Z\s]*/ }


    # Associations 
    # --------------------------------------------------------------------------------------------------------
      validates                       :skus,
                                        presence:       { message: "A Product must have Skus" }
                                          
end
