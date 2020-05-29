h = {"name"=>"Computer Science", "password"=>"a"}
cs = Department.create(h)

john=Student.create(name: 'John Green', department_id: cs.id)
tom=Student.create(name: 'Tom White', department_id: cs.id)
jam=Student.create(name: 'Jam K', department_id: cs.id)
p = Professor.create(name: 'Page Blue', department_id: cs.id)
p2 = Professor.create(name: 'Wills P', department_id: cs.id)
p3 = Professor.create(name: 'Woods H', department_id: cs.id)
cs101 = Course.create(name:'cs101', department_id: cs.id, professor_id: p.id)
cs102 = Course.create(name:'cs 102', department_id: cs.id, professor_id: p2.id)
cs105 = Course.create(name:'cs105', department_id: cs.id, professor_id: p2.id)
cs103 = Course.create(name:'cs103', department_id: cs.id, professor_id: p.id)
cs104 = Course.create(name:'cs 104', department_id: cs.id, professor_id: p.id)
Course.all.each {|course| course.students << john if !john.courses.include?(course)}
Student.all.each {|student| student.courses << cs101 if !cs101.students.include?(student)}
Student.all.each {|student| student.courses << cs104 if !cs104.students.include?(student)}