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
                "#{ Time.diff(Time.now, comment.updated_at, '%y, %M, %d, %H, %N, %S')[:diff] } ago"
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
                # concat(link_to_function 'Delete', "deleteComment(#{reply.id})", style: 'margin-left: 0.4em;')
                concat(link_to 'Delete', delete_comment_blog_path(@blog), style: 'margin-left: 0.4em;', :'data-toggle' => 'modal', :'data-target' => '#loginModal')
              end)
              concat(content_tag(:div, class: 'pull-right') do
                concat(link_to 'Like', 'javascript:void(0);', :'data-toggle' => 'modal', :'data-target' => '#loginModal')
                concat(' / ')
                # concat(link_to_function 'Reply', "replyComment(#{reply.id})")
                concat(link_to 'Reply', post_comment_blog_path(@blog), :'data-toggle' => 'modal', :'data-target' => '#loginModal')
              end)
            end)
            concat(get_all_children(reply))
          end)
        end)
      end.join)
    end
  end
end