MARKDOWN = Redcarpet::Markdown.new(
  Redcarpet::Render::HTML, 
  :autolink => true, 
  :no_intra_emphasis => true, 
  :lax_html_blocks => true,
  :fenced_code_blocks => true
)
