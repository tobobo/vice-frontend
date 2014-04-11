Router = Ember.Router.extend
  location: 'history'

Router.map ->
  this.resource 'stories'

`export default Router`
