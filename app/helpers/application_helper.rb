module ApplicationHelper
  def link_to_modal(path, **params)
    if browser.device.mobile?
      link_to path do
        yield
      end
    else
      link_to path, params.merge(
        data: {
          controller: "modal",
          action: "modal#show",
          turbo_frame: "modal"
        }
      ) do
        yield
      end
    end
  end
end
