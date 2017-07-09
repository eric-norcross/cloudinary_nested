# == Schema Information
#
# Table name: skus
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  identifier :string
#  product_id :integer
#  updated_at :datetime         not null
#

class Sku < ApplicationRecord
  # Product
  # ==========================================================================================================
    belongs_to                      :product,
                                      inverse_of:     :skus

  # Images (Polymorphic) - Required
  # ==========================================================================================================
    has_many                        :images,
                                      ->              { reorder(:order) },
                                      as:             :imageable
                                      # dependent:      :destroy,

    accepts_nested_attributes_for   :images,
                                      allow_destroy:  true,
                                      reject_if:      -> (attributes) {
                                                        attributes['asset'].blank?
                                                      }
end
