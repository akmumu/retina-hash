window.Formathash = 
  init: ->
    $("#format_hash").click ->
      $("#format_hash").hide()
      $("#progress_bar").show()
      
      hash_text = hash_orgin = $.trim($("#hash_text").val())
      if hash_text.substr(0, 1) == '"'
        hash_text = hash_text.substring(1, hash_text.length-1)
      if hash_text.substr(1, 1) == '\\' || hash_text.substr(1, 1) == ':'
        hash_text = 'eval("'+hash_text+'")'
      if hash_text
        $.ajax
          url: "/formathash/format_hash_data"
          method: "POST"
          data: 
            hash_data: hash_text
          complete: ->
            $("#format_hash").show()
            $("#progress_bar").hide()
          success: (data) ->
            if data != 'no'
              $("#the_format_data").html(data)
            else
              Formathash.ugly_format(hash_orgin)
          error: ->
            # alert('识别Ruby的Hash数据不匹配或网络错误、尝试为您提供非精美的格式')
            Formathash.ugly_format(hash_orgin)
          
      else
        alert('一个不空的数据需要在输入框内!')
      
  ugly_format: (text) ->
    text_length = text.length
    format_text = ''
    tab         = '  '
    indent      = 0
    in_quote    = false
    current     = ''
    
    for i in [0..(text_length-1)]
      current = text.charAt(i);
      switch current
        when "{","["
          if in_quote
            format_text += current
          else
            format_text += '<span class="ruby-hash-sym">'+current+'</span>' + "\n" +
               Formathash.repeat_tab(tab, indent + 1)
            indent += 1
        when "}","]"
          if in_quote
            format_text += current
          else
            indent -= 1
            format_text += "\n" + Formathash.repeat_tab(tab, indent) +
              '<span class="ruby-hash-sym">'+current+'</span>'
        when ","
          if in_quote
            format_text += current
          else
            format_text += '<span class="ruby-hash-sym">'+current+'</span>' +
              "\n" + Formathash.repeat_tab(tab, indent)
        when ":"
          if in_quote
            format_text += current
          else
            format_text += '<span class="ruby-hash-sym">'+current+'</span>'
        when ' '
          in_quote
        when "\n"
          in_quote
        when "\t"
          if in_quote
            format_text += current
        when '\\'
          in_quote
        when '"'
          # 这段有可能引号中间有引号，但是ruby有可能出现形如{\"REPORT_DATE\":201410}的数据，故不用
          # if i>0 & text.charAt(i - 1) != '\\'
          #   in_quote = !in_quote
          in_quote = !in_quote
          #format_text += current
          if in_quote
            format_text += '<span class="ruby-hash-key">'+current
          else
            format_text += current+'</span>'
        else
          if !isNaN(current)
            format_text += '<span class="ruby-hash-value">'+current+
            '</span>'
          else
            format_text += current
    $("#the_format_data").html(format_text)
  
  repeat_tab: (tab, count) ->
    return new Array(count + 1).join(tab)
            
  way1hash: (hash_key,hash_value,space_num) ->
    # the_hash = '<span class="ruby-hash-key">"ruby-hash" </span><span class="ruby-hash-sym">=></span><br>'
    numspace = ''
    for x in [0..space_num]
      numspace = numspace + ' '
    the_hash = '<span class="ruby-hash-key">"'+"#{hash_key}"+'"</span>'+
    '<span class="ruby-hash-sym">'+numspace+'=> </span>'+
    '<span class="ruby-hash-value">'+"#{hash_value}"+'</span><br>'

    # alert(numspace)
    $(".tank").append(the_hash);
    $("p").append('<b>Hello world!</b>');
    return
    