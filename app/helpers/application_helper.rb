# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def timestamps(object)
    created = object.created_at.nil? ? "" : content_tag(:div, "created: #{object.created_at}")
    updated = object.updated_at.nil? ? "" : content_tag(:div, "updated: #{object.updated_at}")
    timestamps = content_tag :div, created + updated, :class => "timestamps"
  end
end
