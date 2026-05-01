class Button::Component < ApplicationViewComponent

  html_options { }

  # ==== Properties

  property :label,
    type:     :string,
    required: true

  property :color,
    enum:    %i[primary secondary],
    default: :primary

  property :url,
    type:     :string,
    optional: true

  property :width,
    enum:     %i[auto full],
    optional: true

  # ==== Slots

  # ==== Delegators

  # ==== Instance

  def call
    tag.div(label)
  end

end
