/* 
-- ██████╗░██╗░░░██╗██████╗░███████╗██╗░░░██╗███████╗░██████╗████████╗███╗░░██╗██╗██╗░░██╗
-- ██╔══██╗██║░░░██║██╔══██╗██╔════╝██║░░░██║██╔════╝██╔════╝╚══██╔══╝████╗░██║██║██║░██╔╝
-- ██████╦╝██║░░░██║██████╔╝█████╗░░╚██╗░██╔╝█████╗░░╚█████╗░░░░██║░░░██╔██╗██║██║█████═╝░
-- ██╔══██╗██║░░░██║██╔══██╗██╔══╝░░░╚████╔╝░██╔══╝░░░╚═══██╗░░░██║░░░██║╚████║██║██╔═██╗░
-- ██████╦╝╚██████╔╝██║░░██║███████╗░░╚██╔╝░░███████╗██████╔╝░░░██║░░░██║░╚███║██║██║░╚██╗
-- ╚═════╝░░╚═════╝░╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚══════╝╚═════╝░░░░╚═╝░░░╚═╝░░╚══╝╚═╝╚═╝░░╚═╝*/

class Latch {
  constructor(minRotate = -50, maxRotate = 110) {
    this.minRotate = minRotate;
    this.maxRotate = maxRotate;

    this.trueRotation = randomInteger(this.minRotate, this.maxRotate);
    this.defused = false;

    // console.debug("latch true rotation:", this.trueRotation);
  }

  restore() {
    this.defused = false;
  }

  takeOff() {
    this.defused = true;
  }

  hasTrueRotation(rotation) {
    const eps = 0.001; //It is needed when working with float numbers
    /*
      It is difficult to combine the angle of rotation of our lock pick directly with the permissible angle of click.
      Therefore, we take into account the inaccuracy
    */
    const inaccuracy = 5 + eps;
    return Math.abs(rotation - this.trueRotation) < inaccuracy;
  }
}