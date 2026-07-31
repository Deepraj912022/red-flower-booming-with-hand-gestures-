FLOWER BLOOM — HAND GESTURE CONTROL
=====================================

HOW TO RUN
----------
Windows : double-click "Start-Flower-Bloom-Windows.bat"
Mac     : double-click "Start-Flower-Bloom-Mac.command"
          (first time: right-click it -> Open, since macOS blocks
          unsigned scripts by default)
Anything else (Linux, etc.) : just double-click "flower-bloom.html" itself.

That's it — no install, no server, no Python/Node needed.
It opens straight in your default browser and asks for camera
permission. Hit Allow.

WHAT IT NEEDS
-------------
- An internet connection (the hand-tracking library loads from a
  CDN the first time — it caches after that in most browsers)
- A webcam
- Chrome, Edge, or Firefox (recommended)

GESTURES
--------
- Left hand pinch  -> controls Bloom
- Right hand pinch  -> controls Growth
- Sway your hands   -> creates wind

WHAT I FIXED
------------
The original app.js had a typo that broke the whole script:
  this.instructionsEl ? .classList.add('hidden');
There's a stray space in "?." (optional chaining), which is invalid
JS syntax — it made the entire file fail to load, so nothing ever
rendered. Same typo appeared twice; both are fixed in this version.

IF IT RUNS SLOW ON A LOW-SPEC PC
---------------------------------
Open flower-bloom.html in a text editor and find this block
(search for "modelComplexity"):

    hands.setOptions({
        maxNumHands: 2,
        modelComplexity: 1,
        minDetectionConfidence: 0.65,
        minTrackingConfidence: 0.5,
    });

Change modelComplexity: 1 to modelComplexity: 0 (lighter, faster,
slightly less precise tracking).

A few lines below, you'll also find:

    const cam = new Camera(this.video, {
        onFrame: async () => { await hands.send({ image: this.video }); },
        width: 1280,
        height: 720,
    });

Lowering width/height (e.g. to 640 and 480) reduces the amount of
video the CPU has to process every frame and can noticeably help
on weaker machines.
