class Scale9
	constructor: (@image, x, y, width, height) ->
		@setRect x, y, width, height
		@resize @image.width, @image.height

	setRect: (@rectX, @rectY, @rectW, @rectH) ->

	getRect: ->
		x:@rectX
		y:@rectY
		width:@rectW
		height:@rectH

	resize: (@width, @height) ->

	scale: (scaleX, scaleY = scaleX) ->
		@resize Math.ceil(scaleX * @image.width), Math.ceil(scaleY * @image.height)

	drawImageTo: (context, x, y) ->

		# make sure the rect values are
		# within the bounds of the image
		# this is done here since the state of
		# the image could change at any time

		@_validateRect()


		# slice dimensions
		# note some specific dimensions (such as
		# clipCenterX) are not defined since they
		# will always match a previously defined
		# member (such as @rectX)

		clipRightX = @rectX + @rectW
		leftW = @rectX
		rightW = @image.width - clipRightX
		centerW = @width - (leftW + rightW)
		clipRightW = rightW

		clipBottomY = @rectY + @rectH
		topH = @rectY
		bottomH = @image.height - clipBottomY
		centerH = @height - (topH + bottomH)
		clipBottomH = bottomH


		# make adjustments if resized below the available
		# dimensions of the resizable (center) areas

		if centerW < 0

			centerW = 0

			if leftW is 0
				rightW = @width

			else if rightW is 0
				leftW = @width

			else
				# scale proportionally

				ratio = leftW/rightW
				rightW = Math.ceil @width/(ratio + 1)
				leftW = @width - rightW

		if centerH < 0

			centerH = 0

			if topH is 0
				bottomH = @height

			else if bottomH is 0
				topH = @height

			else
				# scale proportionally

				ratio = topH/bottomH
				bottomH = Math.ceil @height/(ratio + 1)
				topH = @height - bottomH


		# additional dimensions after adjustments

		centerX = x + leftW
		centerY = y + topH
		rightX = x + leftW + centerW
		bottomY = y + topH + centerH


		# perform the various drawImage calls to 
		# draw each of the 9 slices (where visible)

		if leftW > 0

			if topH > 0
				context.drawImage @image,
					0, 0, @rectX, @rectY,
					x, y, leftW, topH

			if centerH > 0
				context.drawImage @image,
					0, @rectY, @rectX, @rectH,
					x, centerY, leftW, centerH

			if bottomH > 0
				context.drawImage @image,
					0, clipBottomY, @rectX, clipBottomH,
					x, bottomY, leftW, bottomH

		if centerW > 0

			if topH > 0
				context.drawImage @image,
					@rectX, 0, @rectW, @rectY,
					centerX, y, centerW, topH

			if centerH > 0
				context.drawImage @image,
					@rectX, @rectY, @rectW, @rectH,
					centerX, centerY, centerW, centerH

			if bottomH > 0
				context.drawImage @image,
					@rectX, clipBottomY, @rectW, clipBottomH,
					centerX, bottomY, centerW, bottomH

		if rightW > 0

			if topH > 0
				context.drawImage @image,
					clipRightX, 0, clipRightW, @rectY,
					rightX, y, rightW, topH

			if centerH > 0
				context.drawImage @image,
					clipRightX, @rectY, clipRightW, @rectH,
					rightX, centerY, rightW, centerH

			if bottomH > 0
				context.drawImage @image,
					clipRightX, clipBottomY, clipRightW, clipBottomH,
					rightX, bottomY, rightW, bottomH

	_validateRect: ->
		@rectX = 0 if @rectX < 0
		@rectX = @image.width if @rectX > @image.width

		@rectY = 0 if @rectY < 0
		@rectY = @image.height if @rectY > @image.height

		@rectW = 0 if @rectW < 0
		maxW = @image.width - @rectX
		@rectW = maxW if @rectW > maxW

		@rectH = 0 if @rectH < 0
		maxH = @image.height - @rectY
		@rectH = maxH if @rectH > maxH

# making the definition globally available
window.Scale9 = Scale9;