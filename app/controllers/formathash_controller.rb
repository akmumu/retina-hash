class FormathashController < ApplicationController
  def index
    #render 'index'
    @logined = true
  end
  
  def format_hash_data
    hash_str = params[:hash_data]
    hash = {}
    
    hash = format_json_data(hash_str)
    if hash == "no"
      hash = {}
      eval("hash = #{hash_str}")
    end
    htmlspans = Formathash.cycle_a_each(hash)
    render text: htmlspans
  rescue Exception => e
    render text: 'no'
  end
  
  def format_json_data(hash_str)
    hash = JSON.parse hash_str
  rescue => e
    hash = 'no'
  end
  
  def blog
    
  end

  def format_hash
    render text: 'contribuilding...'
    @text = '{\"qq_connect\"=>{\"provider\"=>\"qq_connect\", \"uid\"=>\"104098FD3DC57131C1457EB5501896AF\", \"info\"=>{\"nickname\"=>\"AK王子┻┳═\", \"name\"=>\"AK王子┻┳═\", \"image\"=>\"http://qzapp.qlogo.cn/qzapp/100442083/104098FD3DC57131C1457EB5501896AF/50\"}, \"credentials\"=>{\"token\"=>\"F538FF45937887AF7246E50928E0961F\", \"refresh_token\"=>\"6EC400DD7B547B401D29474EA6895214\", \"expires_at\"=>1418310754, \"expires\"=>true}, \"extra\"=>{\"raw_info\"=>{\"ret\"=>0, \"msg\"=>\"\", \"is_lost\"=>0, \"nickname\"=>\"AK王子┻┳═\", \"gender\"=>\"男\", \"province\"=>\"北京\", \"city\"=>\"朝阳\", \"year\"=>\"1989\", \"figureurl\"=>\"http://qzapp.qlogo.cn/qzapp/100442083/104098FD3DC57131C1457EB5501896AF/30\", \"figureurl_1\"=>\"http://qzapp.qlogo.cn/qzapp/100442083/104098FD3DC57131C1457EB5501896AF/50\", \"figureurl_2\"=>\"http://qzapp.qlogo.cn/qzapp/100442083/104098FD3DC57131C1457EB5501896AF/100\", \"figureurl_qq_1\"=>\"http://q.qlogo.cn/qqapp/100442083/104098FD3DC57131C1457EB5501896AF/40\", \"figureurl_qq_2\"=>\"http://q.qlogo.cn/qqapp/100442083/104098FD3DC57131C1457EB5501896AF/100\", \"is_yellow_vip\"=>\"0\", \"vip\"=>\"0\", \"yellow_vip_level\"=>\"0\", \"level\"=>\"0\", \"is_yellow_year_vip\"=>\"0\"}}}}'
    #some = JSON.parse(text)
    #eval(@text)
    aaaa = {}
    eval("aaaa = {\"credentials\"=>{\"token\"=>\"F538FF45937887AF7246E50928E0961F1\", \"refresh_token\"=>\"6EC400DD7B547B401D29474EA68952145\", \"expires_at\"=>1418310654, \"expires\"=>true},\"credentialsers\"=>{\"expires\"=>{\"sanwei\"=>false}},\"keyvalues\"=>\"normal\",\"intiger\"=>1222}")
    hashs = {}
    eval('hashs = {"qq_connect"=>{"provider"=>"qq_connect", "uid"=>"104098FD3DC57131C1457EB5501896AF"},"provider"=>"qq_connect"}')
    @abc = aaaa
    keys = @abc.keys
    @max_key = keys.max_by{|x|x.length}.length
    p @abc.inspect
    #@the_hash = {}
    #@the_hash = aaaa
    @the_hash = '<span class="ruby-hash-key">"ruby-hash" </span><span class="ruby-hash-sym">=></span>'

    
    return @htmlspans = cycle_a_each(@abc)
    @javaskr = '<script type="text/javascript">
  Formathash.way1hash("<%= key %>","{","<%= @max_key - key.length %>");
</script>'
    

    @aline = make_a_span_not_hash('iamkey','iamvalue',2)
    #@the_hash = {"qq_connect"=>{"provider"=>"qq_connect", "uid"=>"104098FD3DC57131C1457EB5501896AF"},"provider"=>"qq_connect",}
  end
  
end