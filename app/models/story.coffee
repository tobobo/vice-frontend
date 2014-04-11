Story = DS.Model.extend
  name: DS.attr 'string'
  region: DS.attr 'number',
    defaultValue: 0
  type: DS.attr 'number',
    defaultValue: 0
  status: DS.attr 'number',
    defaultValue: 0

`export default Story`
