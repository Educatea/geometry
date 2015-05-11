module Geometry::Square

	def self.build(fill_color = 'white')
		@id = rand(1..999)
		@html = "<div id='mygraphiccontainer#{@id}' style='position: relative;width: 100px;height:100px;'></div>"
		@js = "<script>YUI().use('graphics',function(e){var a=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),o=(a.addShape({type:'rect',fill:{color:'#{fill_color}'},stroke:{weight:2,color:'#000'},width:100,height:100,x:0,y:0}));});</script>"
		return self
	end

	def self.build_with_label(value, label_color = 'black')
		@id = rand(1..999)
		@html = "<div id='mygraphiccontainer#{@id}' style='position: relative;width: 100px;height:100px;'><div id='side' style='z-index: 99;position: relative;top: 40px;left: 110px;color: #{label_color};font-weight: bold;'>#{value}</div><div id='base' style='z-index: 99;position: relative;top: 95px;left: 50px;color: #{label_color};font-weight: bold;'>#{value}</div></div>"
		@js = "<script>YUI().use('graphics',function(e){var a=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),o=(a.addShape({type:'rect',fill:{color:'white'},stroke:{weight:2,color:'#000'},width:100,height:100,x:0,y:0}));});</script>"
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