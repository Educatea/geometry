module Geometry::RightTriangle

	def self.build(options = {})
		@type = options[:type] || 1
		@label_color = options[:label_color] || 'black'
		@line_color = options[:line_color] || 'black'
		@graphic_class = options[:graphic_class] || 'geometry_figure'
		@style = options[:style] || ''
		@id = options[:id] || rand(1..999)
		@html = "<div id='mygraphiccontainer#{@id}' class='#{@graphic_class}' style='position: relative;width: 100px;height:100px;#{@style}'></div>"
		case @type
		when 2
			@js = "<script>YUI().use('graphics',function(e){var o=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),i=o.addShape({type:'path',stroke:{weight:2,color:'#{@line_color}',opacity:1}});i.moveTo(0,100),i.lineTo(150,30),i.lineTo(150,100),i.lineTo(0,100),i.end()});</script>"
		when 3
			@js = "<script>YUI().use('graphics',function(e){var o=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),i=o.addShape({type:'path',stroke:{weight:2,color:'#{@line_color}',opacity:1}});i.moveTo(30,50),i.lineTo(150,50),i.lineTo(30,120),i.lineTo(30,50),i.end()});</script>"	
		when 4
			@js = "<script>YUI().use('graphics',function(e){var o=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),i=o.addShape({type:'path',stroke:{weight:2,color:'#{@line_color}',opacity:1}});i.moveTo(150,50),i.lineTo(150,150),i.lineTo(30,50),i.lineTo(150,50),i.end()});</script>"		
		else
			@js = "<script>YUI().use('graphics',function(e){var o=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),i=o.addShape({type:'path',stroke:{weight:2,color:'#{@line_color}',opacity:1}});i.moveTo(50,100),i.lineTo(50,30),i.lineTo(200,100),i.lineTo(50,100),i.end()});</script>"
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

	def self.add_labels(hyp, side, base)
		case @type
		when 2
			new_label = "<div id='hyp' style='z-index: 99;position: relative;top: 30px;left: 75px;color: #{@label_color};font-weight: bold;'>#{hyp.to_s.empty? ? '&nbsp;' : hyp}</div>"
			new_label = "#{new_label}<div id='base' style='z-index: 99;position: relative;top: 90px;left: 75px;color: #{@label_color};font-weight: bold;'>#{base.to_s.empty? ? '&nbsp;' : base}</div>"	
			new_label = "#{new_label}<div id='side' style='z-index: 99;position: relative;top: 20px;left: 160px;color: #{@label_color};font-weight: bold;'>#{side.to_s.empty? ? '&nbsp;' : side}</div>"
		when 3
			new_label = "<div id='hyp' style='z-index: 99;position: relative;top: 95px;left: 85px;color: #{@label_color};font-weight: bold;'>#{hyp.to_s.empty? ? '&nbsp;' : hyp}</div>"
			new_label = "#{new_label}<div id='base' style='z-index: 99;position: relative;top: 10px;left: 75px;color: #{@label_color};font-weight: bold;'>#{base.to_s.empty? ? '&nbsp;' : base}</div>"	
			new_label = "#{new_label}<div id='side' style='z-index: 99;position: relative;top: 40px;left: 10px;color: #{@label_color};font-weight: bold;'>#{side.to_s.empty? ? '&nbsp;' : side}</div>"	
		when 4
			new_label = "<div id='hyp' style='z-index: 99;position: relative;top: 95px;left: 70px;color: #{@label_color};font-weight: bold;'>#{hyp.to_s.empty? ? '&nbsp;' : hyp}</div>"
			new_label = "#{new_label}<div id='base' style='z-index: 99;position: relative;top: 10px;left: 95px;color: #{@label_color};font-weight: bold;'>#{base.to_s.empty? ? '&nbsp;' : base}</div>"	
			new_label = "#{new_label}<div id='side' style='z-index: 99;position: relative;top: 40px;left: 160px;color: #{@label_color};font-weight: bold;'>#{side.to_s.empty? ? '&nbsp;' : side}</div>"	
		else
			new_label = "<div id='hyp' style='z-index: 99;position: relative;top: 45px;left: 125px;color: #{@label_color};font-weight: bold;'>#{hyp.to_s.empty? ? '&nbsp;' : hyp}</div>"
			new_label = "#{new_label}<div id='base' style='z-index: 99;position: relative;top: 90px;left: 105px;color: #{@label_color};font-weight: bold;'>#{base.to_s.empty? ? '&nbsp;' : base}</div>"	
			new_label = "#{new_label}<div id='side' style='z-index: 99;position: relative;top: 20px;left: 30px;color: #{@label_color};font-weight: bold;'>#{side.to_s.empty? ? '&nbsp;' : side}</div>"			
		end
		@html = "#{@html.reverse.sub('>vid/<', '').reverse}#{new_label}</div>"	
		return self
	end

	def self.change_label_color(color)
		@label_color = color		
		return self
	end
end