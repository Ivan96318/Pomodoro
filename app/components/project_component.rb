# frozen_string_literal: true

class ProjectComponent < ViewComponent::Base
  def initialize(project:, classes: nil)
    @project = project
    @classes = classes
  end
end
