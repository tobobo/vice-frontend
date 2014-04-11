ApplicationRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo 'stories'
    
`export default ApplicationRoute`
