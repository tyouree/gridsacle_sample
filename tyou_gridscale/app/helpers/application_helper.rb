module ApplicationHelper

  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "GridScale 株式会社"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  # get message
  def get_message(message_type, screen_code, message_code)
    message = '[' + message_type + screen_code + message_code + ']' + t('err_messages.' + message_code)
    html_statement(message)
  end

  # generate message for views
  def html_statement(str)
    str.gsub(/\\n/, '<br />').html_safe
  end

end
