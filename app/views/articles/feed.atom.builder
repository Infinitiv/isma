atom_feed do |feed|
  feed.title "ISMA"
  latest_article = @articles.last
  feed.updated(latest_article.updated_at)
  @articles.each do |article|
    feed.entry(article) do |entry|
      entry.title article.title
      entry.summary article.content
    end
  end
end