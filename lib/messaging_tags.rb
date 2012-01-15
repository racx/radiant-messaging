# -*- coding: utf-8 -*-
module MessagingTags
  include Radiant::Taggable
  
  tag 'messenger' do |tag|
    tag.expand
  end

  desc %{
    Renders a message form.

    *Usage:*
    <pre><code><r:messenger><r:form>...</r:form></r:messenger></code></pre>
  }
  tag 'messenger:form' do |tag|
    options = tag.attr.dup
    result = %Q{
      <form action="/messages" method="post" id="messaging_form">
        <div>
          #{tag.expand}
        </div>
      </form>
    }
  end

  desc %{
    Show the message text body.

    *Usage:*
    <pre><code><r:messenger:form><r:body /></r:messenger:form></code></pre>
  }
  tag 'messenger:body' do |tag|
    options = tag.attr.dup
    styling = options['style'] ? "style='#{options['style']}'" : ""
    default_text = options['default_text'] || 'write a message here.'
    %{<textarea id="message_body" name="message_body" class="messaging #{options['class']}" rows="3" #{styling} onfocus="this.value=(this.value=='#{default_text}') ? '' : this.value;" onblur="this.value=(this.value=='') ? '#{default_text}' : this.value;">#{default_text}</textarea>}
  end
  
  desc %{
    Selects the active messages.

    *Usage:*
    <pre><code><r:messages [total=3]>...</r:messages></code></pre>
  }
  tag 'messages' do |tag|
    options = tag.attr.dup
    if Message.count > 0
      tag.locals.messages = find_messages(tag, options)
      tag.expand
    else
      'No messages found'
    end
  end

  desc %{
    Iterate through each message.

    *Usage:*
    <pre><code><r:messages:each>...</r:messages:each></code></pre>
  }
  tag 'messages:each' do |tag|

    result = []

    tag.locals.messages.each do |message|
      tag.locals.message = message
      result << tag.expand
    end
    result
  end

  desc %{
    Shows the message author.

    *Usage:*
    <pre><code><r:messages:each></r:author></r:messages:each></code></pre>
  }
  tag 'messages:author' do |tag|
    tag.locals.message.member.name
  end 

  desc %{
    Shows the message body.

    *Usage:*
    <pre><code><r:messages:each></r:body></r:messages:each></code></pre>
  }
  tag 'messages:body' do |tag|
    tag.locals.message.body
  end 

  private

  def find_messages(tag, options)
    return tag.locals.messages if tag.locals.messages
    total = options.delete('total')
    tag.locals.messages = Message.find_all_messages(total)
  end  

end
