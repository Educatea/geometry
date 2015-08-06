module Geometry::IsoscelesTriangle

	def self.build(type = 1)
		@type = type
		@label_color = 'black'
		@id = rand(1..999)
		@html = "<div id='mygraphiccontainer#{@id}' class='geometry_figure' style='position: relative;width: 100px;height:100px;'></div>"
		case @type
		when 2
			@js = "<script>YUI().use('graphics',function(e){var o=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),i=o.addShape({type:'path',stroke:{weight:2,color:'#000',opacity:1}});i.moveTo(50,100),i.lineTo(0,0),i.lineTo(100,0),i.lineTo(50,100),i.end()});</script>"
		else
			@js = "<script>YUI().use('graphics',function(e){var o=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),i=o.addShape({type:'path',stroke:{weight:2,color:'#000',opacity:1}});i.moveTo(50,0),i.lineTo(0,100),i.lineTo(100,100),i.lineTo(50,0),i.end()});</script>"
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

	def self.add_labels(base, side1, side2)
		case @type
		when 2
			new_label = "<div id='itbase' style='z-index: 99;position: relative;left: 40px;color: #{@label_color};font-weight: bold;'>#{base.to_s.empty? ? '&nbsp;' : base}</div>"
			new_label = "#{new_label}<div id='itside1' style='z-index: 99;position: relative;top: 15px;left: 0px;color: #{@label_color};font-weight: bold;'>#{side1.to_s.empty? ? '&nbsp;' : side1}</div>"	
			new_label = "#{new_label}<div id='itside2' style='z-index: 99;position: relative;top: 0px;left: 85px;color: #{@label_color};font-weight: bold;'>#{side2.to_s.empty? ? '&nbsp;' : side2}</div>"
		else
			new_label = "<div id='itbase' style='z-index: 99;position: relative;left: 45px;top: 110px;color: #{@label_color};font-weight: bold;'>#{base.to_s.empty? ? '&nbsp;' : base}</div>"
			new_label = "#{new_label}<div id='itside1' style='z-index: 99;position: relative;top: 20px;left: 0px;color: #{@label_color};font-weight: bold;'>#{side1.to_s.empty? ? '&nbsp;' : side1}</div>"	
			new_label = "#{new_label}<div id='itside2' style='z-index: 99;position: relative;top: 0px;left: 85px;color: #{@label_color};font-weight: bold;'>#{side2.to_s.empty? ? '&nbsp;' : side2}</div>"
		end
		@html = "#{@html.reverse.sub('>vid/<', '').reverse}#{new_label}</div>"	
		return self
	end

	def self.change_label_color(color)
		@label_color = color		
		return self
	end
end