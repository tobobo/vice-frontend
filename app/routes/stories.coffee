StoriesRoute = Ember.Route.extend
  model: ->
    @store.find 'story'

`export default StoriesRoute`
