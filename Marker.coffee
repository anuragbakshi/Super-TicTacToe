superttt.Marker = {}

class superttt.Marker.X extends createjs.Shape
	constructor: (@size) ->
		super()

		@graphics
			.setStrokeStyle 8, "round"
			.beginStroke "red"

		@graphics
			.moveTo -@size / 2, -@size / 2
			.lineTo @size / 2, @size / 2

		@graphics
			.moveTo -@size / 2, @size / 2
			.lineTo @size / 2, -@size / 2

class superttt.Marker.O extends createjs.Shape
	constructor: (@size) ->
		super()

		@graphics
			.setStrokeStyle 8, "round"
			.beginStroke "blue"

		@graphics.drawCircle 0, 0, @size / 2
