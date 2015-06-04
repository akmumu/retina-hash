# coding: utf-8
# 格式化hash格式数据的

class Formathash
  class << self
    def cycle_a_each(hash,tabspace=0)
      max_key_length = get_max_key_length(hash)
      htmlspans = ''
      hash.each do |key,value|
        space_num = max_key_length - key.length
        if value.is_a?(Hash)
          valuespan = make_a_valuespan_with_hash(value,tabspace)
          htmlspans = htmlspans + make_keyspan_with_hash(key,space_num,tabspace) + '<br>' + valuespan
        else
          htmlspans = htmlspans + make_a_span_not_hash(key,value,space_num,tabspace) + '<br>'
        end
      end
      return htmlspans
    end
    
    def make_a_span_not_hash(key,value,space_num=0,tabspace_num=0)
      key   = key.to_s
      value = value.to_s
      numspace = ''
      space_num.downto(0) { |n| numspace = numspace+' ' }
      tabspace = ''
      tabspace_num.downto(1) { |n| tabspace = tabspace+' ' }
      return a_line = tabspace+'<span class="ruby-hash-key">"'+key+
      '"<span class="ruby-hash-sym">'+numspace+'=></span> '+
      '<span class="ruby-hash-value">"'+value+
      '"</span>'
    end
  
    def make_keyspan_with_hash(key,space_num,tabspace_num=0)
      key = key.to_s
      numspace = ''
      space_num.downto(0) { |n| numspace = numspace+' ' }
      tabspace = ''
      tabspace_num.downto(1) { |n| tabspace = tabspace+' ' }
      return a_aline = tabspace+'<span class="ruby-hash-key">"'+key+
      '"<span class="ruby-hash-sym">'+numspace+'=></span> '
    end
  
    def make_a_valuespan_with_hash(hash,tabspace=0)
      valuespan = ''
      tabspace = tabspace + 2
      erweivalue = cycle_a_each(hash,tabspace)
      symbol_tab_num = tabspace - 3
      symbol_tab = ''
      symbol_tab_num.downto(0) { |n| symbol_tab = symbol_tab+' '}
      valuespan = valuespan + symbol_tab+ '{' + '<br>' +
      erweivalue +
      symbol_tab + '}<br>'
      return valuespan
    end
  
    def get_max_key_length(hash)
      if hash.keys.blank?
        return 1
      end
      return hash.keys.max_by{|x|x.length}.length
    end
  end
end