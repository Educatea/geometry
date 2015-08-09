module Geometry::Trapezoid

	def self.build(options = {})
		type = options[:type] || 1
		@type = type
		@label_color = options[:label_color] || 'black'
		graphic_class = options[:graphic_class] || 'geometry_figure'
		style = options[:style] || ''
		line_color = options[:line_color] || 'black'
		@id = options[:id] || rand(1..999)
		@html = "<div id='mygraphiccontainer#{@id}' class='#{graphic_class}' style='position: relative;width: 100px;height:100px;#{style}'></div>"
		case @type
		when 2
			@js = "<script>YUI().use('graphics',function(e){var o=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),i=o.addShape({type:'path',stroke:{weight:2,color:'#{line_color}',opacity:1}});i.moveTo(50,100),i.lineTo(150,100),i.lineTo(200,0),i.lineTo(0,0),i.lineTo(50,100),i.end()});</script>"
		else
			@js = "<script>YUI().use('graphics',function(e){var o=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),i=o.addShape({type:'path',stroke:{weight:2,color:'#{line_color}',opacity:1}});i.moveTo(50,0),i.lineTo(0,100),i.lineTo(200,100),i.lineTo(150,0),i.lineTo(50,0),i.end()});</script>"
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

	def self.add_labels(base1, side1, side2, base2)
		case @type
		when 2
			new_label = "<div id='base1' style='z-index: 99;position: relative;left: 95px;top: -25px;color: #{@label_color};font-weight: bold;'>#{base1.to_s.empty? ? '&nbsp;' : base1}</div>"
			new_label = "#{new_label}<div id='side1' style='z-index: 99;position: relative;top: 20px;left: 190px;color: #{@label_color};font-weight: bold;'>#{side1.to_s.empty? ? '&nbsp;' : side1}</div>"	
			new_label = "#{new_label}<div id='side2' style='z-index: 99;position: relative;top: 2px;left: 0px;color: #{@label_color};font-weight: bold;'>#{side2.to_s.empty? ? '&nbsp;' : side2}</div>"
			new_label = "#{new_label}<div id='base2' style='z-index: 99;position: relative;top: 60px;left: 100px;color: #{@label_color};font-weight: bold;'>#{base2.to_s.empty? ? '&nbsp;' : base2}</div>"
		else
			new_label = "<div id='base1' style='z-index: 99;position: relative;left: 100px;top: 110px;color: #{@label_color};font-weight: bold;'>#{base1.to_s.empty? ? '&nbsp;' : base1}</div>"
			new_label = "#{new_label}<div id='side1' style='z-index: 99;position: relative;top: 20px;left: 0px;color: #{@label_color};font-weight: bold;'>#{side1.to_s.empty? ? '&nbsp;' : side1}</div>"	
			new_label = "#{new_label}<div id='side2' style='z-index: 99;position: relative;top: 2px;left: 190px;color: #{@label_color};font-weight: bold;'>#{side2.to_s.empty? ? '&nbsp;' : side2}</div>"
			new_label = "#{new_label}<div id='base2' style='z-index: 99;position: relative;top: -80px;left: 95px;color: #{@label_color};font-weight: bold;'>#{base2.to_s.empty? ? '&nbsp;' : base2}</div>"
		end
		@html = "#{@html.reverse.sub('>vid/<', '').reverse}#{new_label}</div>"	
		return self
	end

	def self.add_vertices(v1, v2, v3, v4)
		case @type
		when 2
			new_label = "<div id='v1' style='z-index: 99;position: relative;left: 210px;top: -25px;color: #{@label_color};font-weight: bold;'>#{v1.to_s.empty? ? '&nbsp;' : v1}</div>"
			new_label = "#{new_label}<div id='v2' style='z-index: 99;position: relative;top: 95px;left: 150px;color: #{@label_color};font-weight: bold;'>#{v2.to_s.empty? ? '&nbsp;' : v2}</div>"	
			new_label = "#{new_label}<div id='v3' style='z-index: 99;position: relative;top: 75px;left: 40px;color: #{@label_color};font-weight: bold;'>#{v3.to_s.empty? ? '&nbsp;' : v3}</div>"
			new_label = "#{new_label}<div id='v4' style='z-index: 99;position: relative;top: -80px;left: -10px;color: #{@label_color};font-weight: bold;'>#{v4.to_s.empty? ? '&nbsp;' : v4}</div>"
		else
			new_label = "<div id='v1' style='z-index: 99;position: relative;left: -15px;top: 110px;color: #{@label_color};font-weight: bold;'>#{v1.to_s.empty? ? '&nbsp;' : v1}</div>"
			new_label = "#{new_label}<div id='v2' style='z-index: 99;position: relative;top: -40px;left: 35px;color: #{@label_color};font-weight: bold;'>#{v2.to_s.empty? ? '&nbsp;' : v2}</div>"	
			new_label = "#{new_label}<div id='v3' style='z-index: 99;position: relative;top: -60px;left: 160px;color: #{@label_color};font-weight: bold;'>#{v3.to_s.empty? ? '&nbsp;' : v3}</div>"
			new_label = "#{new_label}<div id='v4' style='z-index: 99;position: relative;top: 60px;left: 200px;color: #{@label_color};font-weight: bold;'>#{v4.to_s.empty? ? '&nbsp;' : v4}</div>"
		end
		@html = "#{@html.reverse.sub('>vid/<', '').reverse}#{new_label}</div>"	
		return self
	end

	def self.change_label_color(color)
		@label_color = color		
		return self
	end
end