# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def link_to_modal(name, path, **params)
    link_to name, path, params.merge!(
      data: {
        action: modal_turbo_action,
        turbo_frame: "modal"
      }
    )
  end

  private

  def modal_turbo_action
    browser.device.mobile? ? "bottom-sheet-modal#show" : "modal#show"
  end
end
