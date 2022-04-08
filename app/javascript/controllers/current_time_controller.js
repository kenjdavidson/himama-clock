import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["time","date"]
  static values = {
    timeFormat: { type: String, default: 'hh:mm:ss a' },
    dateFormat: { type: String, default: 'dd MMMM yyyy'}    
  }

  connect() {
    this.currentTime = setInterval(() => this.setCurrentTime(), 1000);
  }

  disconnect() {
    clearInterval(this.currentTime);
  }

  setCurrentTime() {
    const currentTime = new Date();
    this.timeTarget.innerHTML = currentTime.toLocaleTimeString();
    this.dateTarget.innerHTML = currentTime.toDateString();
  }
}
