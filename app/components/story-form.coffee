StoryFormComponent = Ember.Component.extend
  classNames: ['story-form']
  didInsertElement: ->
    Ember.run.schedule 'afterRender', =>
      @$('input').focus()
    @$('input, select').on 'keydown.storyForm', (e) =>
      if e.keyCode == 13
        @send 'save'
  autoSaving: false
  willDestroyElement: ->
    @$('input, select').off 'keydown.storyForm'
  regionOptions: (->
    @get('common.regionNames').map (region, index) ->
      id: index
      name: region
  ).property 'common.regionNames'
  typeOptions: (->
    @get('common.typeNames').map (type, index) ->
      id: index
      name: type
  ).property 'common.typeNames'
  statusOptions: (->
    @get('common.statusNames').map (status, index) ->
      id: index
      name: status
  ).property 'common.statusNames'
  inputsDidChange: (->
    if not @get('autoSaving') and not @get('story.isNew')
      @send 'waitToAutoSave'
  ).observes 'story.name', 'story.status'
  actions:
    waitToAutoSave: ->
      @set 'autoSaving', true
      Ember.run.later =>
        if @get('story.isDirty')
          @send 'autoSave'
      , 250
    autoSave: ->
      @send 'save'
      @get('story').one 'didUpdate', =>
        @set 'autoSaving', false
        if @get('story.isDirty') then @send 'waitToAutoSave'
    save: ->
      @get('story').save()
      @$('input').focus()

    delete: ->
      @get('story').deleteRecord()
      @get('story').save()
      
`export default StoryFormComponent`
