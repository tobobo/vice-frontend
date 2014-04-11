CommonController = Ember.Controller.extend
  isTouch: 'ontouchstart' of window
  enums: 
    story:
      TYPES: ['LIGHT', 'MEDIUM', 'HEAVY']
      REGIONS: ['US', 'MIDEAST', 'AFRICA', 'S_AMERICA', 'CHINA', 'EUROPE', 'ASIA_AUS']
      STATUS: ['PENDING', 'GREENLIT', 'REJECTED']
  regionNames: (->
    @get('enums.story.REGIONS').map (name) ->
      switch name
        when 'US'
          'United States'
        when 'MIDEAST'
          'Middle East'
        when 'AFRICA'
          'Africa'
        when 'S_AMERICA'
          'South America'
        when 'CHINA'
          'China'
        when 'EUROPE'
          'Europe'
        when 'ASIA_AUS'
          'Asia/Australia'
  ).property 'enums.story.REGIONS.@each'

  typeNames: (->
    @get('enums.story.TYPES').map (name) ->
      switch name
        when 'HEAVY'
          'Heavy'
        when 'MEDIUM'
          'Medium'
        when 'LIGHT'
          'Light'
        
  ).property 'enums.story.TYPES.@each'

  statusNames: (->
    @get('enums.story.STATUS').map (name) ->
      switch name
        when 'PENDING'
          'Pending'
        when 'GREENLIT'
          'Greenlit'
        when 'REJECTED'
          'Rejected'
        
  ).property 'enums.story.STATUS.@each'

`export default CommonController`
