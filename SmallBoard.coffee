class superttt.SmallBoard extends createjs.Container
	constructor: (x, y, @size, @position) ->
		super()
		@x = x
		@y = y

		@wonBy = -1

		@board = (-1 for i in [0...9])

		@boardShape = new createjs.Shape
		@boardShape.graphics
			.setStrokeStyle 4, "round"
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

		@hitArea = new createjs.Shape()
		@hitArea.graphics
			.beginFill "black"
			.drawRect -@size / 2, -@size / 2, @size, @size

		@addEventListener "click", (event) =>
			cellX = Math.floor event.localX / @size * 3 + 1.5
			cellY = Math.floor event.localY / @size * 3 + 1.5

			game.onCellClicked @position, cellX * 3 + cellY

	playMove: (player, cell) ->
		@board[cell] = player
		@wonBy = @__checkWin()

		if @wonBy is -1
			cellSize = @size / 3

			marker = new (if player is 0 then superttt.Marker.X else superttt.Marker.O)(cellSize * (1 - superttt.Game.PADDING_FACTOR * 4))
			marker.x = (cell // 3 - 1) * cellSize
			marker.y = (cell % 3 - 1) * cellSize
			@addChild marker
		else
			marker = new (if player is 0 then superttt.Marker.X else superttt.Marker.O)(@size * (1 - superttt.Game.PADDING_FACTOR))
			marker.x = @x
			marker.y = @y

			@removeAllChildren()
			@addChild marker

	__checkWin: ->
		if @wonBy isnt -1
			return @wonBy

		return @board[0] if @board[0] is @board[1] is @board[2]
		return @board[3] if @board[3] is @board[4] is @board[5]
		return @board[6] if @board[6] is @board[7] is @board[8]

		return @board[0] if @board[0] is @board[3] is @board[6]
		return @board[1] if @board[1] is @board[4] is @board[7]
		return @board[2] if @board[2] is @board[5] is @board[8]

		return @board[0] if @board[0] is @board[4] is @board[8]
		return @board[6] if @board[6] is @board[4] is @board[2]

		return -1
