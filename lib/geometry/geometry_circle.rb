module Geometry::Circle

	def self.build
		@id = rand(1..999)
		@html = "<div id='mygraphiccontainer#{@id}' class='geometry_figure' style='position: relative;width: 100px;height:100px;'></div>"
		@js = "<script>YUI().use('graphics',function(e){var a=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),o=(a.addShape({type:'ellipse',fill:{color:'white'},stroke:{weight:2,color:'#000'},width:150,height:150,x:0,y:0}));});</script>"
		return self
	end

	def self.build_with_label(type, value, label_color = 'black')
		@id = rand(1..999)
		@html = "<div id='mygraphiccontainer#{@id}' style='position: relative;width: 100px;height:100px;'><div id='radius' style='z-index: 99;position: relative;top: 55px;left: 110px;color: #{label_color};font-weight: bold;'>#{value}</div></div>"
		case type
		when 'radius'
			@js = "<script>YUI().use('graphics',function(e){var a=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),o=(a.addShape({type:'ellipse',fill:{color:'white'},stroke:{weight:2,color:'#000'},width:150,height:150,x:0,y:0}),a.addShape({type:'path',stroke:{weight:1,color:'#000',opacity:1,dashstyle:[3,4]}}));o.moveTo(75,75),o.lineTo(150,75),o.end()});</script>"
		else
			@js = "<script>YUI().use('graphics',function(e){var a=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),o=(a.addShape({type:'ellipse',fill:{color:'white'},stroke:{weight:2,color:'#000'},width:150,height:150,x:0,y:0}),a.addShape({type:'path',stroke:{weight:1,color:'#000',opacity:1,dashstyle:[3,4]}}));o.moveTo(0,75),o.lineTo(150,75),o.end()});</script>"
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