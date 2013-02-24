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
  def attachment_images(article)
    article.attachments.select {|a| a.mime_type =~ /image/} - [first_image(article)]
  end
    def attachment_noimages(article)
    article.attachments.select {|a| a.mime_type !~ /image/}
  end
  def attachment_name(attachment)
    if %r{[.]} =~ attachment.name
      attachment.name.reverse.from((%r{[.](\W+|\w+)(\W+|\w+)} =~ attachment.name.reverse) + 1).reverse
    else
      attachment.name
    end
  end
end
