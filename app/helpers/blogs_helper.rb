module BlogsHelper
  def get_all_children(comment)
    if comment.replies.size > 0
      content = ''

      if params[:direction].present?
        replies = comment.replies.order("updated_at #{params[:direction].downcase}")
      else
        replies = comment.replies.order('updated_at desc')
      end

      replies.each do |reply|
        content << content_tag(:div, class: 'row-fluid') do
          concat(content_tag(:div, class: 'span1') do
            image_tag(reply.user.profile_pic, width: '100%') if reply.user.present?
          end)
          concat(content_tag(:div, class: 'span11') do
            concat(content_tag(:div, class: 'row-fluid') do
              concat(content_tag(:div, class: 'span4') do
                reply.user.full_name if reply.user.present?
              end)
              concat(content_tag(:div, class: 'pull-right') do
                last_updated_at(reply.updated_at)
              end)
            end)
            concat(content_tag(:div, class: 'row-fluid') do
              concat(content_tag(:div, class: 'span12') do
                raw(reply.message) if reply.message.present?
              end)
            end)
            concat(content_tag(:div, class: 'row-fluid') do
              concat(content_tag(:div, class: 'span6') do
                if current_user
                  concat(link_to 'Share', 'javascript:void(0);')
                  # concat(link_to_function 'Delete', "deleteComment(#{reply.id})", style: 'margin-left: 0.4em;')
                  concat(link_to 'Delete', delete_comment_blog_path(@blog.id, comment_id: reply.id), style: 'margin-left: 0.4em;')
                else
                  concat(link_to 'Share', 'javascript:void(0);', :'data-toggle' => 'modal', :'data-target' => '#loginModal')
                  concat(link_to 'Delete', 'javascript:void(0);', style: 'margin-left: 0.4em;', :'data-toggle' => 'modal', :'data-target' => '#loginModal')
                end
              end)
              concat(content_tag(:div, class: 'pull-right') do
                if current_user
                  if current_user.is_like(reply)
                    # concat(link_to_function 'Unlike', "unlikeComment(#{reply.id})")
                    concat(link_to 'Unlike', unlike_comment_blog_path(@blog.id, comment_id: reply.id))
                  else
                    # concat(link_to_function 'Like', "likeComment(#{reply.id})")
                    concat(link_to 'Like', like_comment_blog_path(@blog.id, comment_id: reply.id))
                  end
                  concat(' / ')
                  concat(link_to_function 'Reply', "replyComment(#{reply.id})")
                else
                  concat(link_to 'Like', 'javascript:void(0);', :'data-toggle' => 'modal', :'data-target' => '#loginModal')
                  concat(' / ')
                  concat(link_to 'Reply', 'javascript:void(0);', :'data-toggle' => 'modal', :'data-target' => '#loginModal')
                end
              end)
            end)
            concat(get_all_children(reply))
          end)
        end
      end
      return content.html_safe
    end
  end

  def last_updated_at(time)
    if Time.diff(Time.now, time)[:year] > 0
      "#{Time.diff(Time.now, time, '%y')[:diff]} ago"
    elsif Time.diff(Time.now, time)[:month] > 0
      "#{Time.diff(Time.now, time, '%M')[:diff]} ago"
    elsif Time.diff(Time.now, time)[:week] > 0
      "#{Time.diff(Time.now, time, '%w')[:diff]} ago"
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