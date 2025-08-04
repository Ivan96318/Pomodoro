class MobileModalComponent < ViewComponent::Base
renders_one :header
renders_one :content
renders_one :footer

  def initialize(title:, **options)
    @title = title
    @options = options
  end

  peivate

  attr_reader :title, :options

  def css_classes
    classes = ["native-modal-overlay"]
    classes << options[:class] if options[:class]
    classes.join(" ")
  end
end
