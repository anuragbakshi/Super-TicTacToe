window.WIDTH = $(window).width()
window.HEIGHT = $(window).height()

$("#main-canvas").attr
	width: WIDTH
	height: HEIGHT

window.game = new superttt.Game new createjs.Stage "main-canvas"
