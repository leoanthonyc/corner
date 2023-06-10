import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { linkId: String, linkUrl: String }
  static targets = [ 'token' ]

  click() {
    event.preventDefault()

    fetch(`links/${this.linkIdValue}/clicks`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': this.tokenTarget.value
      }
    }).then(response => response.json())
      .then(data => {
          if (data.status === 'ok') {
            let a = document.createElement('a');
            a.target = '_blank';
            a.href = this.linkUrlValue;
            a.click();
          } else {
            alert('Error')
          }
        }
      )
  }
}
