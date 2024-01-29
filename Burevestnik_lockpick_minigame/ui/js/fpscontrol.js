/* 
-- ██████╗░██╗░░░██╗██████╗░███████╗██╗░░░██╗███████╗░██████╗████████╗███╗░░██╗██╗██╗░░██╗
-- ██╔══██╗██║░░░██║██╔══██╗██╔════╝██║░░░██║██╔════╝██╔════╝╚══██╔══╝████╗░██║██║██║░██╔╝
-- ██████╦╝██║░░░██║██████╔╝█████╗░░╚██╗░██╔╝█████╗░░╚█████╗░░░░██║░░░██╔██╗██║██║█████═╝░
-- ██╔══██╗██║░░░██║██╔══██╗██╔══╝░░░╚████╔╝░██╔══╝░░░╚═══██╗░░░██║░░░██║╚████║██║██╔═██╗░
-- ██████╦╝╚██████╔╝██║░░██║███████╗░░╚██╔╝░░███████╗██████╔╝░░░██║░░░██║░╚███║██║██║░╚██╗
-- ╚═════╝░░╚═════╝░╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚══════╝╚═════╝░░░░╚═╝░░░╚═╝░░╚══╝╚═╝╚═╝░░╚═╝*/

class FpsControl {
  constructor(fps, callback) {
    this.fps = fps;
    this.callback = callback;

    this.isPlaying = false;
    this.delay = 1000 / fps;
    this.time = null;
    this.frame = -1;
    this.tref;

    this.loopBind = this.loop.bind(this);
  }

  loop(timestamp) {
    if (!this.isPlaying) {
      return;
    }

    if (this.time === null) {
      this.time = timestamp;
    }

    const seg = Math.floor((timestamp - this.time) / this.delay);
    if (seg > this.frame) {
      this.frame = seg;
      this.callback({
        time: timestamp,
        frame: this.frame
      })
    }
    this.tref = requestAnimationFrame(this.loopBind)
  }

  frameRate(newfps) {
    this.fps = newfps;
    this.delay = 1000 / this.fps;
    this.frame = -1;
    this.time = null;
  };

  start() {
    if (!this.isPlaying) {
      this.isPlaying = true;
      this.tref = requestAnimationFrame(this.loopBind);
    }
  };

  pause() {
    if (this.isPlaying) {
      cancelAnimationFrame(this.tref);
      this.isPlaying = false;
      this.time = null;
      this.frame = -1;
    }
  };
}