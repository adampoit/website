import 'dart:html';
import 'package:renderer/renderer.dart';

void main()
{
  var canvas = querySelector("#main");
  var gl = canvas.getContext3d();
  if (gl == null)
    return;
  
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
  
  window.onResize.listen((e)
  {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
  });
  
  var renderer = new Renderer(gl, window);
  
  window.onKeyDown.listen((e) 
  {
    if (e.keyCode == KeyCode.RIGHT)
      renderer.MoveRight();
    if (e.keyCode == KeyCode.LEFT)
      renderer.MoveLeft();
    if (e.keyCode == KeyCode.UP)
      renderer.MoveUp();
    if (e.keyCode == KeyCode.DOWN)
      renderer.MoveDown();
  });
  
  renderer.start();
}