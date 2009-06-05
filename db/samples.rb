pmids = [19415117, 19381341, 19348691, 19339759, 19321867, 19303403, 19261943]
pmids.each do |pmid|
  article = Article.new
  article.update_from_pubmed(pmid)
  article.save
end