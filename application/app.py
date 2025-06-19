from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Lens Corporation is at the forefront of biometrics and AI, building state‑of‑the‑art identification solutions—from face, fingerprint, and iris recognition to cross‑media translation and 3D asset generation—that run efficiently on edge devices, even offline lenscorp.ai. Founded in 2016 in Lansing, Michigan, and now with a growing presence in Gurugram, Lens is driven by a passionate, academically backed team of researchers and engineers, committed to ethical, transparent, and explainable AI By delivering custom, in‑house AI‑powered solutions—including intelligent image analysis, voice and image translation, and realistic 3D modeling—they empower businesses to focus on innovation, not implementation With this dynamic expertise and a global mindset, Lens Corporation doesn’t just meet today’s demands—they build tomorrow’s vision, today."

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
