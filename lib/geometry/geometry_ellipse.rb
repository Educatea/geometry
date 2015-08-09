module Geometry::Ellipse

	def self.build(options = {})
		@type = options[:type] || 1
		graphic_class = options[:graphic_class] || 'geometry_figure'
		fill_color = options[:fill_color] || 'white'
		line_color = options[:line_color] || 'black'
		@label_color = options[:label_color] || 'black'
		style = options[:style] || ''
		if @type == 1
			horizontal = 200
			vertical = 100
		else
			horizontal = 100
			vertical = 200
		end

		@id = options[:id] || rand(1..999)
		@html = "<div id='mygraphiccontainer#{@id}' class='#{graphic_class}' style='position: relative;width: 100px;height:100px;#{style}'></div>"
		@js = "<script>YUI().use('graphics',function(e){var a=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),o=(a.addShape({type:'ellipse',fill:{color:'#{fill_color}'},stroke:{weight:2,color:'#{line_color}'},width:#{horizontal},height:#{vertical},x:0,y:0}));});</script>"
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

	def self.add_labels(horizontal, vertical)
		color = @label_color
		if @type == 1
			new_label = "<div id='horizontal' style='z-index: 99;position: relative;top: 30px;left: 15px;color: #{color};font-weight: bold;'>#{horizontal.to_s.empty? ? '&nbsp;' : horizontal}</div>"
			new_label = "#{new_label}<div id='vertical' style='z-index: 99;position: relative;top: 60px;left: 85px;color: #{color};font-weight: bold;'>#{vertical.to_s.empty? ? '&nbsp;' : vertical}</div>"
			new_js = ",a.addShape({type:'path',stroke:{weight:1,color:'#000',opacity:1,dashstyle:[3,4]}}));o.moveTo(100,0),o.lineTo(100,#{vertical.to_s.empty? ? '0' : '100'}),o.end();a.addShape({type:'path',stroke:{weight:1,color:'#000',opacity:1,dashstyle:[3,4]}});o.moveTo(0,50),o.lineTo(#{horizontal.to_s.empty? ? '0' : '200'},50),o.end()"
		else
			new_label = "<div id='vertical' style='z-index: 99;position: relative;top: 80px;left: 75px;color: #{color};font-weight: bold;'>#{vertical.to_s.empty? ? '&nbsp;' : vertical}</div>"
			new_label = "#{new_label}<div id='horizontal' style='z-index: 99;position: relative;top: 150px;left: 60px;color: #{color};font-weight: bold;'>#{horizontal.to_s.empty? ? '&nbsp;' : horizontal}</div>"
			new_js = ",a.addShape({type:'path',stroke:{weight:1,color:'#000',opacity:1,dashstyle:[3,4]}}));o.moveTo(50,0),o.lineTo(50,#{horizontal.to_s.empty? ? '0' : '200'}),o.end();a.addShape({type:'path',stroke:{weight:1,color:'#000',opacity:1,dashstyle:[3,4]}});o.moveTo(0,100),o.lineTo(#{vertical.to_s.empty? ? '0' : '100'},100),o.end()"
		end
		to_be_replaced = ");});</script>"
		@html = "#{@html.reverse.sub('>vid/<', '').reverse}#{new_label}</div>"
		@js = "#{@js.reverse.sub(to_be_replaced.reverse, '').reverse}#{new_js}});</script>"
		return self
	end

end