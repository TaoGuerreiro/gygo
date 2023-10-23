import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["outputSpan"]

  updateValue(e) {
    const { id } = e.params; // Access params from stimulus https://stimulus.hotwired.dev/reference/actions
    const selectedValue = e.target.value;

    this.outputSpanTargets.forEach((span, index) => {
      if (index === id) {
        span.innerHTML = selectedValue;
      }
    });
  }
}
