IndexRoute = Ember.Route.extend
  beforeModel: ->
    @replaceWith 'stories'
    
`export default IndexRoute`
