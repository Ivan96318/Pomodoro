# frozen_string_literal: true

class ProjectComponent < ViewComponent::Base
  include ApplicationHelper

  renders_one :footer
  
  def initialize(project:, classes: nil)
    @project = project
    @classes = classes
  end
end
