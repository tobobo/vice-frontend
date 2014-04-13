ListRoute = Ember.Route.extend
  model: ->
    console.log 'modeling'
    @modelFor('stories')

`export default ListRoute`
