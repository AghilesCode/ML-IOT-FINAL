from flask import Flask, request
from srv import serve
app = Flask(__name__)

@app.route('/start', methods=['POST'])
def get_books():
    student = request.form['student']
    print(student)
    serve()

    return "Success", 200

if __name__ == '__main__':
    app.run(debug=True)