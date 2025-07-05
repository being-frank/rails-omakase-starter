import { Application } from '@hotwired/stimulus'
import { registerControllers } from 'stimulus-vite-helpers'

const application = Application.start()

// Configure Stimulus development experience
application.warnings = true
application.debug    = false
window.Stimulus      = application

const controllers          = import.meta.glob('./**/*_controller.js', { eager: true })
const componentControllers = import.meta.glob('./../../components/**/controller.js', { eager: true })

// Register controllers
registerControllers(application, controllers)

// Register component controllers
for (const path in componentControllers) {
  if (Object.prototype.hasOwnProperty.call(componentControllers, path)) {
    const module = componentControllers[path]
    const name = path
      .match(/components\/(.+)\/controller\.js$/)[1]
      .replaceAll('/', '-')
      .replaceAll('_', '-')

    application.register(name, module.default)
  }
}

export default application
