StoriesIndexController = Ember.ArrayController.extend
  filteredStories: (->
    @get('model').filter (story) ->
      story.get('id')?
  ).property 'model.@each.id'

`export default StoriesIndexController`
