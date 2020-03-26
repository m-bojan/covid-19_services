
State.create(name: 'حضرموت')

City.create([{name: 'سيؤن', state_id: 1}, {name: 'المكلا', state_id: 1}])

Region.create([{name: 'الشرج', city_id: 2}, {name: 'المكلا', city_id: 2}])

Admin.create(name: 'admin', username: 'username', password: 'password', email: 'admin@email.com')
Admin.create(name: 'super_admin', username: 'super_user', password: 'password', email: 'admin@email.com', role: 'super_admin')

Pharmacy.create(location: 'الشارع الاول', name: 'صيدلية الاقى', region_id: 1)

Item.create([{name: 'كمامه نوع عادي', item_type: 1}, {name: 'قفازات نوع عادي', item_type: 2},{name: 'معقم نوع عادي', item_type: 3}])
