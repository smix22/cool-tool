import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="showcalendar"
export default class extends Controller {
  connect() {
    console.log(this.element)
  }
  showCalendar(){
    console.log(this.element)
    this.element.showPicker()
  }
}
