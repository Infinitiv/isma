module ArticlesHelper
  def first_image(article)
    article.attachments.select {|a| a.mime_type =~ /image/}.first
  end
  def sanitize_full(text)
    Sanitize.clean(text, Sanitize::Config::RELAXED).html_safe
  end
  def sanitize_truncate(text)
    Sanitize.clean(truncate(text, :length => 255, :omission => '... ', :separator => ' '), Sanitize::Config::RELAXED).html_safe
  end
end
