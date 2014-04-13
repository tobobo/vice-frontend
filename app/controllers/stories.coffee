StoriesController = Ember.ArrayController.extend
  newStory: (->
    @store.createRecord 'story'
  ).property 'newStory.isNew'

  newStoryDidCreate: (->
    @pushObject @get('newStory')
  ).observes 'newStory.id'


`export default StoriesController`
