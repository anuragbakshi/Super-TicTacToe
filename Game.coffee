class superttt.Game
	@PADDING_FACTOR: 0.1

	constructor: (@stage) ->
		@activeBoard = -1
		@currentPlayer = 0

		@mainBoard = new superttt.LargeBoard WIDTH / 2, HEIGHT / 2, Math.min(WIDTH, HEIGHT) * (1 - Game.PADDING_FACTOR)
		@stage.addChild @mainBoard
		@stage.update()

	onCellClicked: (boardPosition, cellPosition) ->
		smallBoard = @mainBoard.board[boardPosition]
		if @activeBoard in [-1, boardPosition] and smallBoard.board[cellPosition] is -1 and smallBoard.wonBy is -1
			smallBoard.playMove @currentPlayer, cellPosition

			@activeBoard = if @mainBoard.board[cellPosition].wonBy is -1 then cellPosition else -1
			@currentPlayer = if @currentPlayer is 0 then 1 else 0

			@stage.update()

		if @mainBoard.wonBy isnt -1
			alert "Player #{@mainBoard.wonBy} won the game!"
