module ArticlesHelper
  def citation(article)
    # http://en.wikipedia.org/wiki/Vancouver_system
    issue = article.issue.empty? ? "" : "(#{article.issue})"
    citation = "#{link_to(article.journal.abbreviation, article.journal)}. #{article.year}"
    citation += ";#{article.volume}#{issue}" unless article.volume.blank?
    citation += ":#{article.pages}" unless article.pages.blank?
    citation += "."
    content_tag :div, citation, :class => "citation"
  end
end
