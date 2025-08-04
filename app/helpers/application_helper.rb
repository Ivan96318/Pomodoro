# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def link_to_modal(path, **params, &block)
    if browser.device.mobile?
      # link_to path, &block
      link_to_sheet_modal(path, **params, &block)
    else
      link_to path, params.merge(
        data: {
          controller: 'modal',
          action: 'modal#show',
          turbo_frame: 'modal'
        }
      ), &block
    end
  end

  def link_to_sheet_modal(path, **params, &block)
    link_to path, params.merge!(
      data: {
        action: "click->bottom-sheet-modal#show",
        turbo_frame: "modal-sheet-content",
      }
    ), &block
  end
end
