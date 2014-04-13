Router = Ember.Router.extend
  location: 'history'

Router.map ->
  @resource 'stories', ->
    @route 'list',
      path: 'list'

`export default Router`
