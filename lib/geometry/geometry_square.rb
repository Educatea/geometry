module Geometry::Square

	def self.build(options = {})
		fill_color = options[:fill_color] || 'white'
		line_color = options[:line_color] || 'black'
		graphic_class = options[:graphic_class] || 'geometry_figure'
		style = options[:style] || ''
		@id = options[:id] || rand(1..999)
		@html = "<div id='mygraphiccontainer#{@id}' class='#{graphic_class}' style='position: relative;width: 100px;height:100px;#{style}'></div>"
		@js = "<script>YUI().use('graphics',function(e){var a=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),o=(a.addShape({type:'rect',fill:{color:'#{fill_color}'},stroke:{weight:2,color:'#{line_color}'},width:100,height:100,x:0,y:0}));});</script>"
		return self
	end

	def self.build_with_label(options = {})
		label_color = options[:label_color] || 'black'
		graphic_class = options[:graphic_class] || 'geometry_figure'
		value = options[:value] || 'a'
		line_color = options[:line_color] || 'black'
		fill_color = options[:fill_color] || 'white'
		style = options[:style] || ''
		@id = options[:id] || rand(1..999)
		@html = "<div id='mygraphiccontainer#{@id}' class='#{graphic_class}' style='position: relative;width: 100px;height:100px;#{style}'><div id='side' style='z-index: 99;position: relative;top: 40px;left: 110px;color: #{label_color};font-weight: bold;'>#{value}</div><div id='base' style='z-index: 99;position: relative;top: 95px;left: 50px;color: #{label_color};font-weight: bold;'>#{value}</div></div>"
		@js = "<script>YUI().use('graphics',function(e){var a=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),o=(a.addShape({type:'rect',fill:{color:'#{fill_color}'},stroke:{weight:2,color:'#{line_color}'},width:100,height:100,x:0,y:0}));});</script>"
		return self
	end

	def self.js
		@js
	end


	def self.html
		@html		
	end

	def self.full_html
		"#{@html}#{@js}"
	end

end