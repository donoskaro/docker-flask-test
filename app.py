from flask import Flask

app = Flask(__name__)
app.debug = True

@app.route('/')
def main():
    return '<h1>Hello world!</h1><br><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etenim semper illud extra est, quod arte comprehenditur.</p>'

if __name__ == '__main__':
    app.run()