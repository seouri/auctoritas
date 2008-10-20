module ArticlesHelper
  def citation(article)
    # http://en.wikipedia.org/wiki/Vancouver_system
    issue = article.issue.empty? ? "" : "(#{article.issue})"
    citation = "#{article.journal}. #{article.year};#{article.volume}#{issue}:#{article.pagination}."
    content_tag :div, citation, :class => "citation"
  end
end
