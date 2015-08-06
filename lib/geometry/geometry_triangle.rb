module Geometry::RightTriangle

	def self.build
		@hyp = false
		@base = false
		@side = false
		@id = rand(1..999)
		@html = "<div id='mygraphiccontainer#{@id}' class='geometry_figure' style='position: relative;width: 100px;height:100px;'></div>"
		@js = "<script>YUI().use('graphics',function(e){var o=new e.Graphic({autoSize:!0,render:'#mygraphiccontainer#{@id}'}),i=o.addShape({type:'path',stroke:{weight:2,color:'#000',opacity:1}});i.moveTo(0,100),i.lineTo(150,30),i.lineTo(150,100),i.lineTo(0,100),i.end()});</script>"
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

	def self.add_label(part, label)
		case part
		when 'hypothenus'
			@hyp = true
			new_label = "<div id='hyp' style='z-index: 99;position: relative;top: 30px;left: 75px;color: red;font-weight: bold;'>#{label}</div>"
		when 'side'
			if @hyp && @base
				new_label = "<div id='side' style='z-index: 99;position: relative;top: 20px;left: 160px;color: red;font-weight: bold;'>#{label}</div>"
			elsif @hyp || @base
				new_label = "<div id='side' style='z-index: 99;position: relative;top: 40px;left: 160px;color: red;font-weight: bold;'>#{label}</div>"
			else	
				new_label = "<div id='side' style='z-index: 99;position: relative;top: 55px;left: 160px;color: red;font-weight: bold;'>#{label}</div>"					
			end
			@side = true
		else
			@base = true
			new_label = "<div id='base' style='z-index: 99;position: relative;top: 110px;left: 75px;color: red;font-weight: bold;'>#{label}</div>"
		end	
		@html = "#{@html.reverse.sub('>vid/<', '').reverse}#{new_label}</div>"	
		return self
	end

	def self.add_labels(hyp, side, base)
		new_label = "<div id='hyp' style='z-index: 99;position: relative;top: 30px;left: 75px;color: red;font-weight: bold;'>#{hyp}</div>"
		new_label = "#{new_label}<div id='base' style='z-index: 99;position: relative;top: 110px;left: 75px;color: red;font-weight: bold;'>#{base}</div>"	
		new_label = "#{new_label}<div id='side' style='z-index: 99;position: relative;top: 20px;left: 160px;color: red;font-weight: bold;'>#{side}</div>"
		@html = "#{@html.reverse.sub('>vid/<', '').reverse}#{new_label}</div>"	
		return self
	end
end