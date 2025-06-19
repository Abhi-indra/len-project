from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Lens Corporation stands as a trusted and innovative leader in its industry, consistently delivering high-quality products and exceptional service. With a strong commitment to excellence, integrity, and customer satisfaction, Lens Corporation continues to set new standards and build lasting relationships with clients and partners worldwide."

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
