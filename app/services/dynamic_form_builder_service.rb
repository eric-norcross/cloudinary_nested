require 'cloudinary'

class DynamicFormBuilderService < ActionView::Helpers::FormBuilder
  include ActionView::Helpers
  include ActionView::Context
  include Haml::Helpers
  include CloudinaryHelper

  def initialize(object_name, object, template, options)
    init_haml_helpers

    super(object_name, object, template, options)
  end

  private

end