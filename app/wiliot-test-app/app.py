#!/usr/bin/python3

# ------------------------------------------------
# Program by hvv19890828
#
#
# Version      Date           Info
# 1.0          10-08-2020     First born unicorn
#
# ----------------------------------------------

from flask import Flask, render_template, make_response, jsonify
from datetime import datetime
from pytz import timezone
from waitress import serve

app = Flask(__name__)

# Root route
@app.route('/')
def index():
    #Getting current time
    ny_tz = timezone('America/New_York')
    ny_time = datetime.now(ny_tz)
    ny_time_fmtd = ny_time.strftime('%Y-%m-%d_%H-%M-%S')
    berlin_tz = timezone('Europe/Berlin')
    berlin_time = datetime.now(berlin_tz)
    berlin_time_fmtd = berlin_time.strftime('%Y-%m-%d_%H-%M-%S')
    tokyo_tz = timezone('Asia/Tokyo')
    tokyo_time = datetime.now(tokyo_tz)
    tokyo_time_fmtd = tokyo_time.strftime('%Y-%m-%d_%H-%M-%S')
    return render_template("index.html", inNY=ny_time_fmtd, inBerlin=berlin_time_fmtd, inTokyo=tokyo_time_fmtd)

# /health route
@app.route("/health")
def health():
    response = make_response(jsonify({"Response": "200"}), 200)
    response.headers["Content-Type"] = "application/json"
    return response


#--------Main------------------
if __name__ == "__main__":
    serve(app, host="0.0.0.0", port=8080)
#------------------------------

