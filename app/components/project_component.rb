# frozen_string_literal: true

class ProjectComponent < ViewComponent::Base
  include ApplicationHelper
  
  def initialize(project:, edit_path:, delete_path:, classes: nil)
    @project = project
    @edit_path = edit_path
    @delete_path = delete_path
    @classes = classes
  end
end
