class Status < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: '新品'},
    {id: 3, name: 'ほぼ新品'},
    {id: 4, name: '傷あり'},
    {id: 5, name: '汚れあり'}
  ]
end
