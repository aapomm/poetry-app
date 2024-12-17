import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "player" ]

  static values = {
    code: String,
    host: String,
    readyUrl: String,
    startUrl: String
  }

  initialize() {
  }

  playerTargetConnected(target) {
    console.log('player connected!')

    if (target.children.length < 2 && this.hostValue == 'true') {
      const deleteLink = document.createElement('a')
      deleteLink.setAttribute('data-turbo-method', 'delete')
      deleteLink.setAttribute('data-turbo-confirm', 'Are you sure?')
      deleteLink.setAttribute('href', '/games/' + this.codeValue + '/remove_player?player_id=' + target.dataset.playerId)

      const deleteText = document.createTextNode('Remove')
      deleteLink.appendChild(deleteText)

      const td = document.createElement('td')
      td.appendChild(deleteLink)
      target.appendChild(td)
    }
  }

  ready() {
    if (this.playerTargets.length % 2 != 0) {
      alert("Need an even number of players!")
      return
    }
    else {
      fetch(this.readyUrlValue, {
        method: 'POST',
        headers: this._getFetchHeaders()
      }).
        then(response => response.text()).
        then(html => Turbo.renderStreamMessage(html))
    }
  }

  start() {
    fetch(this.startUrlValue, {
      method: 'POST',
      headers: this._getFetchHeaders(),
    }).
      then(response => response.text()).
      then(html => this.element.innerHTML = html)
  }

  _getFetchHeaders() {
    return {
      Accept: "text/vnd.turbo-stream.html",
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
      'Content-Type': 'application/json'
    }
  }
}
