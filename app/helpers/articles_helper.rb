module ArticlesHelper
  def citation(article)
    # http://en.wikipedia.org/wiki/Vancouver_system
    citation = "#{article.journal}. #{article.year};#{article.volume}(#{article.issue}):#{article.pagination}."
    content_tag :div, citation, :class => "citation"
  end
end
