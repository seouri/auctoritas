module AuthorsHelper
  def coauthor_matrix(author)
    articles = author.articles
    return "" unless articles.size > 1
    tr = []
    th = ["<th></th>"]
    1.upto(articles.size - 1) do |a1|
      th.push(content_tag(:th, link_to("#{author.last_name}#{a1 + 1}", articles[a1])))
    end
    tr.push(content_tag(:tr, th.join("\n")))
    0.upto(articles.size - 2) do |a1|
      td = []
      td.push(content_tag(:th, link_to("#{author.last_name}#{a1 + 1}", articles[a1])))
      1.upto(articles.size - 1) do |a2|
        common_coauthors = (articles[a1].authors & articles[a2].authors).size - 1
        css_class = a2 > a1 && common_coauthors > 0 ? "has_common_coauthor" : "no_common_coauthor"
        td.push(content_tag(:td, common_coauthors, :class => css_class))
      end
      tr.push(content_tag(:tr, td.join("\n")))
    end
    content_tag(:table, tr.join("\n"))
  end
end
