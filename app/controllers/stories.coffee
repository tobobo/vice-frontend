StoriesController = Ember.ArrayController.extend
  newStory: (->
    @store.createRecord 'story'
  ).property 'newStory.isNew'

  newStoryDidCreate: (->
    @pushObject @get('newStory')
  ).observes 'newStory.id'

  filteredStories: (->
    @get('model').filter (story) ->
      story.get('id')?
  ).property 'model.@each.id'


`export default StoriesController`
