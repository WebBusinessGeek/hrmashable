module BlogsHelper
  def get_all_children(comment)
    if comment.replies.size > 0
      simple_format(comment.replies.each do |reply|
        concat(content_tag(:div, class: 'row-fluid') do
          concat(content_tag(:div, class: 'span1') do
            image_tag(reply.user.profile_pic, width: '100%') if reply.user.present?
          end)
          concat(content_tag(:div, class: 'span11') do
            concat(content_tag(:div, class: 'row-fluid') do
              concat(content_tag(:div, class: 'span4') do
                reply.user.full_name if reply.user.present?
              end)
              concat(content_tag(:div, class: 'pull-right') do
                last_updated_at(comment.updated_at)
              end)
            end)
            concat(content_tag(:div, class: 'row-fluid') do
              concat(content_tag(:div, class: 'span12') do
                simple_format(reply.message) if reply.message.present?
              end)
            end)
            concat(content_tag(:div, class: 'row-fluid') do
              concat(content_tag(:div, class: 'span6') do
                concat(link_to 'Share', 'javascript:void(0);', :'data-toggle' => 'modal', :'data-target' => '#loginModal')
                concat(link_to_function 'Delete', "deleteComment(#{reply.id})", style: 'margin-left: 0.4em;')
              end)
              concat(content_tag(:div, class: 'pull-right') do
                concat(link_to 'Like', 'javascript:void(0);', :'data-toggle' => 'modal', :'data-target' => '#loginModal')
                concat(' / ')
                concat(link_to_function 'Reply', "replyComment(#{reply.id})")
              end)
            end)
            concat(get_all_children(reply))
          end)
        end)
      end.join)
    end
  end

  def last_updated_at(time)
    if Time.diff(Time.now, time)[:year] > 0
      "#{Time.diff(Time.now, time, '%y')[:diff]} ago"
    elsif Time.diff(Time.now, time)[:month] > 0
      "#{Time.diff(Time.now, time, '%M')[:diff]} ago"
    elsif Time.diff(Time.now, time)[:day] > 0
      "#{Time.diff(Time.now, time, '%d')[:diff]} ago"
    elsif Time.diff(Time.now, time)[:hour] > 0
      "#{Time.diff(Time.now, time, '%H')[:diff]} ago"
    elsif Time.diff(Time.now, time)[:minute] > 0
      "#{Time.diff(Time.now, time, '%N')[:diff]} ago"
    elsif Time.diff(Time.now, time)[:second] > 0
      "#{Time.diff(Time.now, time, '%S')[:diff]} ago"
    end
  end
end