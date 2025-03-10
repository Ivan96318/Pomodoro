module DetectDevise
  extend ActiveSupport::Concern

  included do
    before_action :detect_devise_variant
  end

  private

  def detect_devise_variant
    request.variant = :phone if browser.device.mobile?
  end
end
