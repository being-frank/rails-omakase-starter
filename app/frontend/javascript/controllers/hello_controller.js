import ApplicationController from './application'

export default class extends ApplicationController {

  static classes = []

  static outlets = []

  static targets = []

  static values = {}

  initialize() {}

  connect() {
    console.log('HelloController connected')
  }

  // ==== Actions

  // ==== Callbacks

  // ==== Private

}
