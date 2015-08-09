module Geometry::Rectangle

	def self.build(options = {})
		type = options[:type] || 1
		fill_color = options[:fill_color] || 'white'
		line_color = options[:line_color] || 'black'
		graphic_class = options[:graphic_class] || 'geometry_figure'
		style = options[:style] || ''
		@id = options[:id] || rand(1..999)
		@label_color = options[:label_color] || 'black'
		@type = type
		@html = "<div id='mygraphiccontainer#{@id}' class='#{graphic_class}' style='position: relative;width: 100px;height:100px;#{style}'></div>"
		case type
		when 2
			@js = "<script>YUI().use('graphics',function(e){var a=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),o=(a.addShape({type:'rect',fill:{color:'#{fill_color}'},stroke:{weight:2,color:'#{line_color}'},width:200,height:100,x:0,y:0}));});</script>"
		else
			@js = "<script>YUI().use('graphics',function(e){var a=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),o=(a.addShape({type:'rect',fill:{color:'#{fill_color}'},stroke:{weight:2,color:'#{line_color}'},width:100,height:200,x:0,y:0}));});</script>"
		end
		return self
	end

	def self.add_labels(base, side)
		case @type
		when 2
			new_label = "<div id='side' style='z-index: 99;position: relative;top: 110px;left: 90px;color: #{@label_color};font-weight: bold;'>#{side.to_s.empty? ? '&nbsp;' : side}</div>"	
			new_label = "#{new_label}<div id='base' style='z-index: 99;position: relative;top: 20px;left: 220px;color: #{@label_color};font-weight: bold;'>#{base.to_s.empty? ? '&nbsp;' : base}</div>"
		else
			new_label = "<div id='base' style='z-index: 99;position: relative;top: 210px;left: 45px;color: #{@label_color};font-weight: bold;'>#{base.to_s.empty? ? '&nbsp;' : base}</div>"	
			new_label = "#{new_label}<div id='side' style='z-index: 99;position: relative;top: 70px;left: 110px;color: #{@label_color};font-weight: bold;'>#{side.to_s.empty? ? '&nbsp;' : side}</div>"
		end
		@html = "#{@html.reverse.sub('>vid/<', '').reverse}#{new_label}</div>"	
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