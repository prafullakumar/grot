class Grot.MenuWidget extends GrotEngine.Widget
    # Menu widget

    group: null
    menuLayer: null
    game: null

    constructor: (config) ->
        super

        @background = new Kinetic.Rect
            width: 1600
            height: 900
            x: 0
            y: 0
            fill: cfg.gameOverMessageColor
            opacity: 0.85

        @gameName = new Kinetic.Text
            x: 785
            y: 100
            text: 'Grot'
            align: 'center'
            fontSize: 60
            fontFamily: cfg.fontFamily
            fontStyle: cfg.fontStyle
            fill: cfg.fontMenuColor

        @line = new Kinetic.Rect
            x: 550
            y: 200
            width: 600
            height: 2
            fill: cfg.fontMenuColor

        resetGameImageObj = new Image()
        @resetGameImg = new Kinetic.Image
            x: 685
            y: 300
            image: resetGameImageObj
            width: 75
            height: 75

        @resetGameText = new Kinetic.Text
            x: 660
            y: 400
            text: 'New Game'
            align: 'center'
            fontSize: 25
            fontFamily: cfg.fontFamily
            fontStyle: cfg.fontStyle
            fill: cfg.fontMenuColor

        scoreBoardImageObj = new Image()
        @scoreBoardLinkImg = new Kinetic.Image
            x: 960
            y: 300
            image: scoreBoardImageObj
            width: 75
            height: 75

        @scoreBoardLinkText = new Kinetic.Text
            x: 935
            y: 400
            text: 'High scores'
            align: 'center'
            fontSize: 25
            fontFamily: cfg.fontFamily
            fontStyle: cfg.fontStyle
            fill: cfg.fontMenuColor

        aboutImageObj = new Image()
        @aboutImg = new Kinetic.Image
            x: 685
            y: 550
            image: aboutImageObj
            width: 75
            height: 75

        @aboutText = new Kinetic.Text
            x: 685
            y: 650
            text: 'About'
            align: 'center'
            fontSize: 25
            fontFamily: cfg.fontFamily
            fontStyle: cfg.fontStyle
            fill: cfg.fontMenuColor

        resumeImageObj = new Image()
        @resumeImg = new Kinetic.Image
            x: 960
            y: 550
            image: resumeImageObj
            width: 75
            height: 75

        @resumeText = new Kinetic.Text
            x: 960
            y: 650
            text: 'Resume'
            align: 'center'
            fontSize: 25
            fontFamily: cfg.fontFamily
            fontStyle: cfg.fontStyle
            fill: cfg.fontMenuColor


        resetGameImageObj.src = 'img/menu-new-game-icon.png'
        scoreBoardImageObj.src = 'img/menu-high-score-icon.png'
        aboutImageObj.src = 'img/menu-about-icon.png'
        resumeImageObj.src = 'img/menu-resume-icon.png'

        @resetGameImg.on 'mousedown touchstart', (event) =>
            window.location.replace(window.location.href)

        @resetGameText.on 'mousedown touchstart', (event) =>
            window.location.replace(window.location.href)

        @scoreBoardLinkImg.on 'mousedown touchstart', (event) =>
            window.location.replace(cfg.scoreBoardLink)

        @scoreBoardLinkText.on 'mousedown touchstart', (event) =>
            window.location.replace(cfg.scoreBoardLink)

        @aboutImg.on 'mousedown touchstart', (event) =>
            @fire 'menuRemove'
            @menuLayer.fire 'showHelp'

        @aboutText.on 'mousedown touchstart', (event) =>
            @fire 'menuRemove'
            @menuLayer.fire 'showHelp'

        @resumeImg.on 'mousedown touchstart', @close

        @resumeText.on 'mousedown touchstart', @close

        @on 'menuDraw', @draw
        @on 'menuRemove', @close

    draw: () =>
        @add @background
        @add @gameName
        @add @line
        @add @resetGameImg
        @add @resetGameText
        @add @scoreBoardLinkImg
        @add @scoreBoardLinkText
        @add @aboutImg
        @add @aboutText
        @add @resumeImg
        @add @resumeText
        @getLayer().draw()

    close: () =>
        @removeChildren()
        @menuLayer.fire 'closeMenuOverlay'

class Grot.GameOverWidget extends GrotEngine.Widget
    # Game over widget

    game: null
    menuLayer: null

    constructor: (config) ->
        super

        @background = new Kinetic.Rect
            width: 1600
            height: 900
            x: 0
            y: 0
            fill: cfg.gameOverMessageColor
            opacity: 0.85

        @line = new Kinetic.Rect
            x: 550
            y: 200
            width: 600
            height: 2
            fill: cfg.fontMenuColor

        @gameOverMsg = new Kinetic.Text
            x: 850
            y: 125
            text: 'Game Over'
            align: 'center'
            fontSize: 60
            fontFamily: cfg.fontFamily
            fontStyle: cfg.fontStyle
            fill: cfg.fontMenuColor

        @yourScoreMsg = new Kinetic.Text
            x: 875
            y: 300
            text: 'Your Score:'
            align: 'center'
            fontSize: 40
            fontFamily: cfg.fontFamily
            fontStyle: cfg.fontStyle
            fill: cfg.fontMenuColor

        @scoreResult = new Kinetic.Text
            x: 850
            y: 350
            text: ''
            align: 'center'
            fontSize: 35
            fontfamily: cfg.fontFamily
            fontStyle: cfg.fontStyle
            fill: '#00BFFF'

        resetGameImageObj = new Image()
        @resetGameImg = new Kinetic.Image
            x: 685
            y: 500
            image: resetGameImageObj
            width: 75
            height: 75

        @resetGameText = new Kinetic.Text
            x: 725
            y: 600
            text: 'New Game'
            align: 'center'
            fontSize: 25
            fontFamily: cfg.fontFamily
            fontStyle: cfg.fontStyle
            fill: cfg.fontMenuColor

        scoreBoardImageObj = new Image()
        @scoreBoardLinkImg = new Kinetic.Image
            x: 960
            y: 500
            image: scoreBoardImageObj
            width: 75
            height: 75

        @scoreBoardLinkText = new Kinetic.Text
            x: 1000
            y: 600
            text: 'High scores'
            align: 'center'
            fontSize: 25
            fontFamily: cfg.fontFamily
            fontStyle: cfg.fontStyle
            fill: cfg.fontMenuColor

        resetGameImageObj.src = 'img/menu-new-game-icon.png'
        scoreBoardImageObj.src = 'img/menu-high-score-icon.png'

        @resetGameImg.on 'mousedown touchstart', (event) =>
            window.location.replace(window.location.href)

        @resetGameText.on 'mousedown touchstart', (event) =>
            window.location.replace(window.location.href)

        @scoreBoardLinkImg.on 'mousedown touchstart', (event) =>
            window.location.replace(cfg.scoreBoardLink)

        @scoreBoardLinkText.on 'mousedown touchstart', (event) =>
            window.location.replace(cfg.scoreBoardLink)

        @centerElement(@gameOverMsg)
        @centerElement(@yourScoreMsg)
        @centerElement(@resetGameText)
        @centerElement(@scoreBoardLinkText)

        @on 'gameOverDraw', @draw
        @on 'gameOverRemove', @close

    draw: (score) =>
        @scoreResult.setText(score)
        @centerElement(@scoreResult)
        @add @background
        @add @gameOverMsg
        @add @line
        @add @yourScoreMsg
        @add @scoreResult
        @add @resetGameImg
        @add @resetGameText
        @add @scoreBoardLinkImg
        @add @scoreBoardLinkText
        @getLayer().draw()

    close: () =>
        @removeChildren()
        @menuLayer.fire 'closeMenuOverlay'

class Grot.HelpWidget extends GrotEngine.Widget
    # Game over widget

    game: null
    menuLayer: null

    constructor: (config) ->
        super

        @background = new Kinetic.Rect
            width: 1600
            height: 900
            x: 0
            y: 0
            fill: cfg.gameOverMessageColor
            opacity: 0.85

        @container = new GrotEngine.Widget
            width: 600
            height: 900
            margins: {x: '50%', y: 0}
            layer: @menuLayer

        @appName = new Kinetic.Text
            x: 10
            y: 50
            fontSize: 60
            fontFamily: cfg.fontFamily
            text: 'GROT'
            fill: cfg.fontMenuColor

        @engAppName = @appName.clone
            y: 110
            x: 10
            fontSize: 36
            text: '(eng. Arrowhead)'

        @description = @appName.clone
            y: 180
            x: 10
            width: 580
            fontSize: 26
            text: cfg.helpDesc

        @points = @appName.clone
            y: 550
            x: 25
            fontSize: 30
            text: 'Points:'

        @pointsVisualisation = new GrotEngine.Widget
            width: 580
            height: 42
            x: 10
            y: 600

        @circle1 = new Kinetic.Circle
            x: 50
            y: 50
            radius: 40
            fill: cfg.circleColor1

        @circlePoints1 = new Kinetic.Text
            x: 100
            y: 35
            text: 'x1'
            fill: cfg.fontMenuColor
            fontSize: 30
            fontFamily: cfg.fontFamily

        @circle2 = @circle1.clone
            x: 190
            fill: cfg.circleColor2

        @circlePoints2 = @circlePoints1.clone
            x: 240
            text: 'x2'

        @circle3 = @circle1.clone
            x: 330
            fill: cfg.circleColor3

        @circlePoints3 = @circlePoints1.clone
            x: 380
            text: 'x3'

        @circle4 = @circle1.clone
            x: 470
            fill: cfg.circleColor4

        @circlePoints4 = @circlePoints1.clone
            x: 520
            text: 'x4'

        resumeImageObj = new Image()
        @resumeImg = new Kinetic.Image
            x: 265
            y: 740
            image: resumeImageObj
            width: 75
            height: 75

        @resumeText = new Kinetic.Text
            x: 260
            y: 820
            text: 'Resume'
            align: 'center'
            fontSize: 25
            fontFamily: cfg.fontFamily
            fontStyle: cfg.fontStyle
            fill: cfg.fontMenuColor

        resumeImageObj.src = 'img/menu-resume-icon.png'

        @resumeImg.on 'mousedown touchstart', @close
        @resumeText.on 'mousedown touchstart', @close

        @on 'helpDraw', @draw
        @on 'helpRemove', @close
        @fire 'update'

    updateHandler: ->
        if @menuLayer.parent
            @background.width(@menuLayer.canvas.width / @menuLayer.currentScale)
            @container.fire 'update'

    draw: () =>
        @add @background
        @add @container
        @container.add @appName
        @container.add @engAppName
        @container.add @description
        @container.add @points
        @container.add @pointsVisualisation
        @pointsVisualisation.add @circle1
        @pointsVisualisation.add @circlePoints1
        @pointsVisualisation.add @circle2
        @pointsVisualisation.add @circlePoints2
        @pointsVisualisation.add @circle3
        @pointsVisualisation.add @circlePoints3
        @pointsVisualisation.add @circle4
        @pointsVisualisation.add @circlePoints4
        @container.add @resumeImg
        @container.add @resumeText
        @getLayer().draw()

    close: () =>
        @removeChildren()
        @menuLayer.fire 'closeMenuOverlay'

class Grot.MenuOverlay extends GrotEngine.Layer
    # Menu, GameOver, Help widgets

    renderManager: null

    constructor: ->
        super

        @gameOverWidget = new Grot.GameOverWidget
            menuLayer: @

        @menuWidget = new Grot.MenuWidget
            menuLayer: @

        @helpWidget = new Grot.HelpWidget
            menuLayer: @

        @on 'showGameOver', @gameOverWidgetDraw
        @on 'showMenu', @menuWidgetDraw
        @on 'showHelp', @helpWidgetDraw
        @on 'closeMenuOverlay', @closeMenuOverlay

    closeMenuOverlay: ->
        @removeChildren
        @draw()

    updateHandler: ->
        super
        @gameOverWidget.fire 'update'
        @menuWidget.fire 'update'
        @helpWidget.fire 'update'

    gameOverWidgetDraw: (score) ->
        @add @gameOverWidget
        @gameOverWidget.fire 'gameOverDraw', score

    menuWidgetDraw: () ->
        @add @menuWidget
        @menuWidget.fire 'menuDraw'

    helpWidgetDraw: () ->
        @add @helpWidget
        @helpWidget.fire 'helpDraw'
