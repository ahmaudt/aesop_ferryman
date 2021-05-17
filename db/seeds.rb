# frozen_string_literal: true

Student.create(first_name: 'Binky', last_name: 'Templeton', uga_myid: 'binkytempleton', major_id: 1, advisor_id: 1)
Petition.create(petition_type: 'permit-override', content: 'POD for FACS 2000E, Fall 2021', advisor_id: 1, student_id: 1)
Major.create(name: 'HDFS', department_id: 1)
Department.create(name: 'HDFS')
