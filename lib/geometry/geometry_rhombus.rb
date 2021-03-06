module Geometry::Rhombus

	def self.build(options = {})
		@label_color = options[:label_color] || 'black'
		graphic_class = options[:graphic_class] || 'geometry_figure'
		style = options[:style] || ''
		@line_color = options[:line_color] || 'black'
		@id = options[:id] || rand(1..999)
		@html = "<div id='mygraphiccontainer#{@id}' class='#{graphic_class}' style='position: relative;width: 100px;height:100px;#{style}'></div>"
		@js = "<script>YUI().use('graphics',function(e){var o=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),i=o.addShape({type:'path',stroke:{weight:2,color:'#{@line_color}',opacity:1}});i.moveTo(0,50),i.lineTo(100,100),i.lineTo(200,50),i.lineTo(100,0),i.lineTo(0,50),i.end()});</script>"
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

	def self.add_labels(base1, side1, side2, base2)
		new_label = "<div id='base1' style='z-index: 99;position: relative;left: 25px;top: 90px;color: #{@label_color};font-weight: bold;'>#{base1.to_s.empty? ? '&nbsp;' : base1}</div>"
		new_label = "#{new_label}<div id='side1' style='z-index: 99;position: relative;top: -20px;left: 20px;color: #{@label_color};font-weight: bold;'>#{side1.to_s.empty? ? '&nbsp;' : side1}</div>"
		new_label = "#{new_label}<div id='side2' style='z-index: 99;position: relative;top: 50px;left: 170px;color: #{@label_color};font-weight: bold;'>#{side2.to_s.empty? ? '&nbsp;' : side2}</div>"
		new_label = "#{new_label}<div id='base2' style='z-index: 99;position: relative;top: -55px;left: 170px;color: #{@label_color};font-weight: bold;'>#{base2.to_s.empty? ? '&nbsp;' : base2}</div>"
		@html = "#{@html.reverse.sub('>vid/<', '').reverse}#{new_label}</div>"	
		return self
	end

	def self.add_vertices(v1, v2, v3, v4, v5)
		new_label = "<div id='v1' style='z-index: 99;position: relative;left: -20px;top: 42px;color: #{@label_color};font-weight: bold;'>#{v1.to_s.empty? ? '&nbsp;' : v1}</div>"
		new_label = "#{new_label}<div id='v2' style='z-index: 99;position: relative;top: -50px;left: 95px;color: #{@label_color};font-weight: bold;'>#{v2.to_s.empty? ? '&nbsp;' : v2}</div>"
		new_label = "#{new_label}<div id='v3' style='z-index: 99;position: relative;top: 5px;left: 220px;color: #{@label_color};font-weight: bold;'>#{v3.to_s.empty? ? '&nbsp;' : v3}</div>"
		new_label = "#{new_label}<div id='v4' style='z-index: 99;position: relative;top: 65px;left: 95px;color: #{@label_color};font-weight: bold;'>#{v4.to_s.empty? ? '&nbsp;' : v4}</div>"
		new_label = "#{new_label}<div id='v5' style='z-index: 99;position: relative;top: -20px;left: 105px;color: #{@label_color};font-weight: bold;'>#{v5.to_s.empty? ? '&nbsp;' : v5}</div>"
		@html = "#{@html.reverse.sub('>vid/<', '').reverse}#{new_label}</div>"
		@js = "<script>YUI().use('graphics',function(e){var o=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),a=o.addShape({type:'path',stroke:{weight:2,color:'#{@line_color}',opacity:1}});a.moveTo(0,50),a.lineTo(100,100),a.lineTo(200,50),a.lineTo(100,0),a.lineTo(0,50),a.end(),c=o.addShape({type:'path',stroke:{weight:2,color:'#{@line_color}',opacity:1}}),c.moveTo(0,0),c.lineTo(100,100),d=o.addShape({type:'path',stroke:{weight:2,color:'black',opacity:1,dashstyle:[3,4]}}),d.moveTo(100,0),d.lineTo(100,100),d.end(),d=o.addShape({type:'path',stroke:{weight:2,color:'black',opacity:1,dashstyle:[3,4]}}),d.moveTo(0,50),d.lineTo(200,50),d.end()});</script>"
		return self
	end

	def self.change_label_color(color)
		@label_color = color		
		return self
	end
end