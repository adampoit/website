import 'dart:html';
import 'package:renderer/renderer.dart';
import 'package:renderer/model.dart';
import 'package:vector_math/vector_math.dart';

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
  
  var model = new Model();
  model.init(gl, 'http://localhost:5000/cube.json');
  
  var renderer = new Renderer(gl, window);
  
  window.onKeyDown.listen((e) 
  {
    if (e.keyCode == KeyCode.RIGHT)
      model.Position += new Vector3(0.0, 0.0, -0.1);
    if (e.keyCode == KeyCode.LEFT)
      model.Position += new Vector3(0.0, 0.0, 0.1);
    if (e.keyCode == KeyCode.UP)
      model.Position += new Vector3(-0.1, 0.0, 0.0);
    if (e.keyCode == KeyCode.DOWN)
      model.Position += new Vector3(0.1, 0.0, 0.0);
  });
  
  renderer.start(model);
}