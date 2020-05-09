h = {:name => 'sc', :password => 'dd'}
cs = Department.create(h)
john=Student.create(name: 'john')
john.dep_id = cs.id
john.save
p = Professor.create(name: 'p')
p.dep_id = cs.id
p.save
cs101 = Course.create(name:'cs101', dep_id: cs.id, prof_id: p.id)