module Geometry::Circle

	def self.build(options = {})
		graphic_class = options[:graphic_class] || 'geometry_figure'
		fill_color = options[:fill_color] || 'white'
		line_color = options[:line_color] || 'black'
		style = options[:style] || ''
		@id = options[:id] || rand(1..999)
		@html = "<div id='mygraphiccontainer#{@id}' class='#{graphic_class}' style='position: relative;width: 100px;height:100px;#{style}'></div>"
		@js = "<script>YUI().use('graphics',function(e){var a=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),o=(a.addShape({type:'ellipse',fill:{color:'#{fill_color}'},stroke:{weight:2,color:'#{line_color}'},width:150,height:150,x:0,y:0}));});</script>"
		return self
	end

	def self.build_with_label(options = {})
		type = options[:type] || 1
		value = options[:value] || 'r'
		graphic_class = options[:graphic_class] || 'geometry_figure'
		fill_color = options[:fill_color] || 'white'
		line_color = options[:line_color] || 'black'
		label_color = options[:label_color] || 'black'
		style = options[:style] || ''
		@id = options[:id] || rand(1..999)
		@html = "<div id='mygraphiccontainer#{@id}' class='#{graphic_class}' style='position: relative;width: 100px;height:100px;#{style}'><div id='radius' style='z-index: 99;position: relative;top: 55px;left: 110px;color: #{label_color};font-weight: bold;'>#{value}</div></div>"
		case type
		when 'radius'
			@js = "<script>YUI().use('graphics',function(e){var a=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),o=(a.addShape({type:'ellipse',fill:{color:'#{fill_color}'},stroke:{weight:2,color:'#{line_color}'},width:150,height:150,x:0,y:0}),a.addShape({type:'path',stroke:{weight:1,color:'#{line_color}',opacity:1,dashstyle:[3,4]}}));o.moveTo(75,75),o.lineTo(150,75),o.end()});</script>"
		else
			@js = "<script>YUI().use('graphics',function(e){var a=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),o=(a.addShape({type:'ellipse',fill:{color:'#{fill_color}'},stroke:{weight:2,color:'#{line_color}'},width:150,height:150,x:0,y:0}),a.addShape({type:'path',stroke:{weight:1,color:'#{line_color}',opacity:1,dashstyle:[3,4]}}));o.moveTo(0,75),o.lineTo(150,75),o.end()});</script>"
		end
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