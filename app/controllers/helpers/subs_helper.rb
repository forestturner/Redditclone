module SubsHelper
  def auth_helper
    html = "<input type=\"hidden\""
    html += "name=\"authenticity_token\""
    html += "value=\"#{form_authenticity_token}\">"
    html.html_safe
  end
end
