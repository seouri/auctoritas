module ArticlesHelper
  def citation(article)
    # http://en.wikipedia.org/wiki/Vancouver_system
    citation = "#{article.journal}. #{article.year};#{article.volume}(#{article.issue}):#{article.pagination}."
    content_tag :div, citation, :class => "citation"
  end
  
  def timestamps(article)
    created = article.created_at.nil? ? "" : content_tag(:div, "created: #{article.created_at}")
    updated = article.updated_at.nil? ? "" : content_tag(:div, "updated: #{article.updated_at}")
    timestamps = content_tag :div, created + updated, :class => "timestamps"
  end
end
