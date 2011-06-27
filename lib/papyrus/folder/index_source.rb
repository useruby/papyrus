class Content::Blog::IndexSource < Riddle::Configuration::XMLSource
  def initialize
    super 'blog_source', 'xmlpipe2'
    @xmlpipe_command = "cat #{Rails.root}/tmp/indexes/articles.xml"
  end
end
