module ApplicationHelper
  def details
    details = {}
    Detail.all.each do |d|
      details[d.key] = d.value
    end
    details
  end

  
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end
  
  def current_user_writer?
    current_user.groups.where(writer: true).count > 0 unless current_user.nil?
  end
  
  def current_user_moderator?
    current_user.groups.where(moderator: true).count > 0 unless current_user.nil?
  end

  def current_user_commentator?
    current_user.groups.where(commentator: true).count > 0 unless current_user.nil?
  end

  def current_user_administrator?
    current_user.groups.where(administrator: true).count > 0 unless current_user.nil?
  end
  
  def menu_up
    menu_up = Hash.new
    Menu.where(:parent_id => nil, :location => 'up').each do |m|
      menu_up[m] = Menu.where(parent_id: m.id).order(:follow_id)
    end
    menu_up
  end
  
  def caret
    "<b class=caret></b>"
  end
  
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
end