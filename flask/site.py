from flask import Flask, jsonify
from flask.ext.cors import CORS, cross_origin
app = Flask(__name__)
cors = CORS(app)

@app.route("/cube.json")
def cube():
    vertices = [
        -1.0, -1.0, -1.0, #0
        -1.0, -1.0,  1.0, #1
        -1.0,  1.0, -1.0, #2
        -1.0,  1.0,  1.0, #3
         1.0, -1.0, -1.0, #4
         1.0, -1.0,  1.0, #5
         1.0,  1.0, -1.0, #6
         1.0,  1.0,  1.0  #7
    ]
    indicies = [
        1,  3,  5,    1,  3,  7, # Front face
        0,  2,  4,    2,  4,  6, # Back face
        2,  3,  7,    2,  6,  7, # Top face
        0,  1,  5,    0,  4,  5, # Bottom face
        4,  5,  7,    4,  6,  7, # Right face
        0,  1,  3,    0,  2,  3  # Left face
    ]
    return jsonify(vertices = vertices, indicies = indicies)

if __name__ == "__main__":
    app.run()
