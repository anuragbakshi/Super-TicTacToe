class superttt.LargeBoard extends createjs.Container
	constructor: (x, y, @size) ->
		super()
		@x = x
		@y = y

		@wonBy = -1

		cellSize = @size / 3
		@board = (new superttt.SmallBoard((i // 3 - 1) * cellSize, (i % 3 - 1) * cellSize, cellSize - @size * superttt.Game.PADDING_FACTOR, i) for i in [0...9])
		@addChild b for b in @board

		@boardShape = new createjs.Shape
		@boardShape.graphics
			.setStrokeStyle 16, "round"
			.beginStroke "black"

		@boardShape.graphics
			.moveTo -@size / 6, -@size / 2
			.lineTo -@size / 6, @size / 2

		@boardShape.graphics
			.moveTo @size / 6, -@size / 2
			.lineTo @size / 6, @size / 2

		@boardShape.graphics
			.moveTo -@size / 2, -@size / 6
			.lineTo @size / 2, -@size / 6

		@boardShape.graphics
			.moveTo -@size / 2, @size / 6
			.lineTo @size / 2, @size / 6

		@addChild @boardShape
