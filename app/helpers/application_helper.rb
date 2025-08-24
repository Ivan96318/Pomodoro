# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def link_to_modal(name, path, **params)
    link_to name, path, params.merge!(
      data: {
        action: browser.device.mobile? ? "bottom-sheet-modal#show" : "modal#show",
        turbo_frame: "modal"
      }
    )
  end
end
