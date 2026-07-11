class Button::Preview < ApplicationViewComponentPreview

  # @param label [String] "Button label"
  # @param color [Symbol] "Color variant"
  # @param url [String] url "Adding a URL will use `link_to` in the style of a button"
  # @param width [Symbol]
  def playground(
    label: 'Button',
    color: :primary,
    url:   '',
    width: :auto
  )
    render Button::Component.new(
      label: label,
      color: color,
      url:   url,
      width: width
    )
  end

end
