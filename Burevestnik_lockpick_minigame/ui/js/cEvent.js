/* 
-- ██████╗░██╗░░░██╗██████╗░███████╗██╗░░░██╗███████╗░██████╗████████╗███╗░░██╗██╗██╗░░██╗
-- ██╔══██╗██║░░░██║██╔══██╗██╔════╝██║░░░██║██╔════╝██╔════╝╚══██╔══╝████╗░██║██║██║░██╔╝
-- ██████╦╝██║░░░██║██████╔╝█████╗░░╚██╗░██╔╝█████╗░░╚█████╗░░░░██║░░░██╔██╗██║██║█████═╝░
-- ██╔══██╗██║░░░██║██╔══██╗██╔══╝░░░╚████╔╝░██╔══╝░░░╚═══██╗░░░██║░░░██║╚████║██║██╔═██╗░
-- ██████╦╝╚██████╔╝██║░░██║███████╗░░╚██╔╝░░███████╗██████╔╝░░░██║░░░██║░╚███║██║██║░╚██╗
-- ╚═════╝░░╚═════╝░╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚══════╝╚═════╝░░░░╚═╝░░░╚═╝░░╚══╝╚═╝╚═╝░░╚═╝*/

class CEvent {
  /**
   * @type Array<Function>
   */
  #handlers
  
  constructor() {
    this.#handlers = [];
  }

  /**
   * @param {Function} handler
   */
  set on(handler) {
    if (!this.#handlers.includes(handler)) {
      this.#handlers.push(handler);
    }
  }

  /**
   * @param {Function} handler
   */
  set off(handler) {
    const index = this.#handlers.indexOf(handler);
    if (index > -1) {
      this.#handlers.splice(index, 1);
    }
  }

  /**
   * @param  {...any} args handler parameters
   */
  invoke(...args) {
    this.#handlers.forEach((handler) => handler(...args));
  }
}