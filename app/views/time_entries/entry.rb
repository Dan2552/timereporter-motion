class TimeViewEntry < TimeViewBase

  attr_accessor :container, :time_entry

  def reuse(options={})
    super(options).tap do |view|
      hold = UILongPressGestureRecognizer.alloc.initWithTarget(
        view, action:"handleHold:"
      )
      hold.minimumPressDuration = 0.1;
      hold.allowableMovement = 600;

      view.userInteractionEnabled = true
      pan = UIPanGestureRecognizer.alloc.initWithTarget(
        view,
        action:"handlePan:"
      )
      pan.delegate = view;
      view.gestureRecognizers = [hold, pan]
    end
  end

  def handleHold(gesture)
    if gesture.state == UIGestureRecognizerStateBegan
      self.selected = true
      @relative_top = gesture.locationInView(self).y
    end
    self.selected = false if gesture.state == UIGestureRecognizerStateEnded
  end

  def handlePan(gesture)
    if selected? && gesture.state == UIGestureRecognizerStateChanged
      touchPoint = gesture.locationInView(container.superview)
      self.y = touchPoint.y - @relative_top if touchPoint
    end
  end

  def gestureRecognizer(gestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer:otherGestureRecognizer)
    true
  end

  def text= text
    views = self.subviews.select {|v| v.is_a? UILabel }
    views.each {|v| v.text = text }
  end

  def wobble= wobble
    if wobble
      addAnimation(getShakeAnimation, forKey:"wobbles")
    else
      layer.removeAnimationForKey("wobbles")
    end
  end

  def selected?
    @selected == true
  end

  def selected= set_selected
    return if set_selected == selected?

    targetView = container
    if set_selected
      targetView = container.superview
      self.y = self.y - container.contentOffset.y
    else
      self.y = self.y + container.contentOffset.y
    end
    targetView.addSubview(self)

    self.wobble = !set_selected
    enlarge(set_selected)
    move_to_nearest_valid if !set_selected
    @selected = set_selected
  end

  def move_to_nearest_valid
    self.container.move_to_nearest_valid(self)
  end

  def enlarge selected
    sizeChange = 10
    sizeChange = 0 - sizeChange if !selected
    #UIView.animate do
      self.x = self.x - sizeChange
      self.y = self.y - sizeChange
      self.height = self.height + (sizeChange * 2)
      self.width = self.width + (sizeChange * 2)
    #end
  end

  def getShakeAnimation
    animation = CAKeyframeAnimation.animationWithKeyPath("transform")

    wobbleAngle = 0.03 #TODO: make wobble less for taller views

    valLeft = NSValue.valueWithCATransform3D(CATransform3DMakeRotation(wobbleAngle, 0.0, 0.0, 1.0))
    valRight = NSValue.valueWithCATransform3D(CATransform3DMakeRotation(-wobbleAngle, 0.0, 0.0, 1.0))
    animation.values = [valLeft, valRight]

    animation.autoreverses = true
    animation.duration = 0.125
    animation.repeatCount = 100000

    return animation
  end

end
