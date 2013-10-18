# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#  Attributes

#  KRA


a1= KraAttr.create!(name: 'Drive Project Effectiveness',weightage: '30',desc: '
a) Effectively estimate each project to ensure effective project planning in consultation with Project Manager
b) Effectively design the architecture for the project to give direction to team members
c) Review technical designs developed by the Senior Software Developer and resolve design issues
d) Ensure timely code reviews are conducted by the Senior Software Developer
e) Document codes and list description of the programme, special instructions and any changes made in database tables on procedural, modular and database level at each stage of the SDLC',
measures: 'a) Estimation to be conducted within (3) days of receipt of project specification; (less than 5%) deviations from project estimations
b) Architecture to be designed within (3) days of receipt of project specification
c) (Zero) delays in project completion due to improper design review
d) (Zero) delays in conducting code reviews in the middle and end a particular module
e) Weekly documentation and check in ')

a2= KraAttr.create!(name: 'Customer Satisfaction',weightage: '25',desc: 'a) Ensure all team members adopt a "Customer First" orientation and fully own and rigorously support the customer at at all times
b) Ensure expected customer service levels are understood and implemented by the team to meet set service standards    
c) Train representatives of client to use the programme developed    
',measures: 'a) Achieve defined TAT in responding to customer queries; (Zero) escalations from customer; (daily) project status updates to be submitted
b) Achieve a set CSAT score of (X) for project per (quarter)
c) Training to be conducted within (5) days of project completion ')

a3= KraAttr.create!(name: 'Internal Process Effectiveness',weightage: '30',desc: 'a) Ensure adherence to defined operating and quality standards
b) Report and submit project progress reports and relevant documentations
c) Provide a report on project learnings on completion of the project 
d) Contribute towards the Knowledge Management initiative of the Company  ',
measures: 'a) (Zero) non compliances to be reported on institutionalised processes. (Zero) recurrence of earlier non-compliances        
b) Report to submitted every (2) days during the project
c) Report on project learning to be developed within (3) days of project completion
d) (2) sessions to be conducted per (quarter); (2) articles / write ups to be contributed per (quarter)')

a4= KraAttr.create!(name: 'Employee Engagement',weightage: '15',desc: 'a) Enhance knowledge and capability (technical and behavioural competence) of self to deliver business results 
b) Mentor Senior Software Developers and Software Developers
c) Drive a performance oriented culture within the department',measures: 'a) (100%) attendance for trainings that are organised
b) (2) team members to be mentored every (quarter)
c) (Zero) delays in conducting PPRs and DRs of team members ')



# DR

dr1=DrAttr.create!(name: 'Self Development', weightage: '10', desc: 'Demonstrating personal responsibility for career management, learning and development – Taking personal responsibility for setting own performance / developmental objectives, meeting training and self-developmental goals.  Actively seeking feedback – Ensuring that all reviews are conducted in time, actively seeking feedback from superiors/colleagues/customers.						')
dr2=DrAttr.create!(name: 'Building Team Value', weightage: '20', desc: 'Actively participates and contributes in achieving group goals. Takes bottom-line responsibility for his/her role in the team and the tasks assigned. Facilitates and contributes to group functioning and group goals. Promotes and demonstrates trust, mutual respect and a cooperative work environment.						')
dr3=DrAttr.create!(name: 'Initiative ', weightage: '10', desc: 'Takes appropriate action before being asked or being forced by circumstance, for the benefit of team or organization. Acts on opportunities to improve work processes and demonstrates creative and innovative thinking to contribute to organizational and individual objectives. Takes a proactive, self-reliant approach, identifying and seizing opportunities and takes decisive action.						')
dr4=DrAttr.create!(name: 'Fostering a Learning Culture', weightage: '20', desc: 'Sharing professional and technical knowledge within his/her team and outside team. Participation in learning forums. Adding to and drawing from the company’s knowledge databases to improve business performance.						')
dr5=DrAttr.create!(name: 'Communication Effectiveness', weightage: '20', desc: 'Able to articulate the concepts and procedures required to perform the job. Adequate communication skills to contribute effectively in team meetings. Ability to write clear and concise concept notes, official documents and project documents to explain complex ideas. Guides team members by explaining complex ideas in simple terms.						')
dr6=DrAttr.create!(name: 'Problem Solving', weightage: '20', desc: 'Identifies and determines the criticality of a problem. Gathers all relevant and accurate information about the problem and systematically breaks down problems into parts. Analyses relationships among parts and recognizes likely underlying causes. Following from these analysis, should be able to draw logical conclusions and sound inferences.						')



dept1 = Department.create!(name: 'BU1')
dept2 = Department.create!(name: 'BU3')
dept3 = Department.create!(name: 'BU2')
dept4 = Department.create!(name: 'BU4')
dept5 = Department.create!(name: 'BU5')

apc1= AppraisalCycle.create!(start_date: '2008-1-01', end_date: '2008-5-30')
apc2= AppraisalCycle.create!(start_date: '2008-6-01', end_date: '2008-12-31')
apc3= AppraisalCycle.create!(start_date: '2009-1-13', end_date: '2009-5-30')
apc4= AppraisalCycle.create!(start_date: '2009-6-13', end_date: '2009-12-31')
apc5= AppraisalCycle.create!(start_date: '2010-1-04', end_date: '2010-5-30')
apc6= AppraisalCycle.create!(start_date: '2010-6-04', end_date: '2010-12-31')
apc7= AppraisalCycle.create!(start_date: '2011-1-04', end_date: '2011-5-30')
apc8= AppraisalCycle.create!(start_date: '2011-6-04', end_date: '2011-12-31')
apc9= AppraisalCycle.create!(start_date: '2012-1-04', end_date: '2012-5-30')
apc10= AppraisalCycle.create!(start_date: '2012-6-04', end_date: '2012-12-31')
apc11= AppraisalCycle.create!(start_date: '2013-1-04', end_date: '2013-5-30')
apc12= AppraisalCycle.create!(start_date: '2013-6-04', end_date: '2013-12-31')

dev = Role.create!(name: 'Developer')
sdev = Role.create!(name: 'Senior Developer')
pmgr = Role.create!(name: 'Project Manager')
prj_lead = Role.create!(name: 'Project Lead')
tlead = Role.create!(name: 'Team Lead')
ceo = Role.create!(name: 'CEO')
coo = Role.create!(name: 'COO')
architect = Role.create!(name: 'Architect')

r_atr = KraRoleAttr.create!(kra_attr_id: a1.id, role_id: dev.id)
r_atr1 = KraRoleAttr.create!(kra_attr_id: a2.id, role_id: dev.id)
r_atr2 = KraRoleAttr.create!(kra_attr_id: a3.id, role_id: dev.id)
r_atr3 = KraRoleAttr.create!(kra_attr_id: a4.id, role_id: dev.id)

r_atr3 = KraRoleAttr.create!(kra_attr_id: a1.id, role_id: sdev.id)
r_atr4 = KraRoleAttr.create!(kra_attr_id: a2.id, role_id: sdev.id)
r_atr5 = KraRoleAttr.create!(kra_attr_id: a3.id, role_id: sdev.id)
r_atr6 = KraRoleAttr.create!(kra_attr_id: a4.id, role_id: sdev.id)

r_atr6 = KraRoleAttr.create!(kra_attr_id: a1.id, role_id: pmgr.id)
r_atr7 = KraRoleAttr.create!(kra_attr_id: a2.id, role_id: pmgr.id)
r_atr8 = KraRoleAttr.create!(kra_attr_id: a3.id, role_id: pmgr.id)
r_atr9 = KraRoleAttr.create!(kra_attr_id: a4.id, role_id: pmgr.id)

r_atr10 = KraRoleAttr.create!(kra_attr_id: a1.id, role_id: tlead.id)
r_atr11 = KraRoleAttr.create!(kra_attr_id: a2.id, role_id: tlead.id)
r_atr12 = KraRoleAttr.create!(kra_attr_id: a3.id, role_id: tlead.id)
r_atr13 = KraRoleAttr.create!(kra_attr_id: a4.id, role_id: tlead.id)

r_atr14 = KraRoleAttr.create!(kra_attr_id: a1.id, role_id: ceo.id)
r_atr15 = KraRoleAttr.create!(kra_attr_id: a2.id, role_id: ceo.id)
r_atr16 = KraRoleAttr.create!(kra_attr_id: a3.id, role_id: ceo.id)
r_atr17 = KraRoleAttr.create!(kra_attr_id: a4.id, role_id: ceo.id)





admin= User.create!(email: 'admin@neevtech.com', password: '12345678', first_name: 'admin', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'admin')
puru= User.create!(email: 'puru@neevtech.com', password: '12345678', first_name: 'puru_aprsr', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraiser')

naga= User.create!(email: 'naga@neevtech.com', password: '12345678', first_name: 'naga_aprsr', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraiser')
rama= User.create!(email: 'rama@neevtech.com', password: '12345678', first_name: 'rama_aprsr', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraiser')
ali= User.create!(email: 'ali@neevtech.com', password: '12345678', first_name: 'ali_aprsr', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraiser')
kk= User.create!(email: 'kk@neevtech.com', password: '12345678', first_name: 'kk_appraisee', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraisee')
sama= User.create!(email: 'sama@neevtech.com', password: '12345678', first_name: 'sama_appraisee', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraisee')

p_d = DepartmentUser.create!(department_id: dept1.id, user_id: puru.id)
n_d = DepartmentUser.create!(department_id: dept1.id, user_id: naga.id)
r_d = DepartmentUser.create!(department_id: dept5.id, user_id: rama.id)
a_d = DepartmentUser.create!(department_id: dept2.id, user_id: ali.id)
k_d = DepartmentUser.create!(department_id: dept3.id, user_id: kk.id)
s_d = DepartmentUser.create!(department_id: dept4.id, user_id: sama.id)



p_ru = RoleUser.create!(user_id: puru.id, role_id: dev.id, appraisal_cycles_id: apc1.id)
p_ru1 = RoleUser.create!(user_id: puru.id, role_id: dev.id, appraisal_cycles_id: apc2.id)
p_ru2 = RoleUser.create!(user_id: puru.id, role_id: dev.id, appraisal_cycles_id: apc3.id)
p_ru3 = RoleUser.create!(user_id: puru.id, role_id: dev.id, appraisal_cycles_id: apc4.id)
p_ru4 = RoleUser.create!(user_id: puru.id, role_id: dev.id, appraisal_cycles_id: apc5.id)
p_ru5 = RoleUser.create!(user_id: puru.id, role_id: dev.id, appraisal_cycles_id: apc6.id)
p_ru6 = RoleUser.create!(user_id: puru.id, role_id: sdev.id, appraisal_cycles_id: apc7.id)
p_ru7 = RoleUser.create!(user_id: puru.id, role_id: sdev.id, appraisal_cycles_id: apc8.id)
p_ru8 = RoleUser.create!(user_id: puru.id, role_id: sdev.id, appraisal_cycles_id: apc9.id)
p_ru9 = RoleUser.create!(user_id: puru.id, role_id: sdev.id, appraisal_cycles_id: apc10.id)
p_ru10 = RoleUser.create!(user_id: puru.id, role_id: sdev.id, appraisal_cycles_id: apc11.id)

n_ru1 = RoleUser.create!(user_id: naga.id, role_id: dev.id, appraisal_cycles_id: apc1.id)
n_ru2 = RoleUser.create!(user_id: naga.id, role_id: dev.id, appraisal_cycles_id: apc2.id)
n_ru3 = RoleUser.create!(user_id: naga.id, role_id: dev.id, appraisal_cycles_id: apc3.id)

r_ru1 = RoleUser.create!(user_id: rama.id, role_id: pmgr.id, appraisal_cycles_id: apc1.id)
r_ru2 = RoleUser.create!(user_id: rama.id, role_id: pmgr.id, appraisal_cycles_id: apc2.id)
r_ru3 = RoleUser.create!(user_id: rama.id, role_id: pmgr.id, appraisal_cycles_id: apc3.id)

a_ru1 = RoleUser.create!(user_id: ali.id, role_id: sdev.id, appraisal_cycles_id: apc1.id)
a_ru2 = RoleUser.create!(user_id: ali.id, role_id: sdev.id, appraisal_cycles_id: apc2.id)
a_ru3 = RoleUser.create!(user_id: ali.id, role_id: sdev.id, appraisal_cycles_id: apc3.id)

k_ru1 = RoleUser.create!(user_id: kk.id, role_id: dev.id, appraisal_cycles_id: apc2.id)
k_ru2 = RoleUser.create!(user_id: kk.id, role_id: dev.id, appraisal_cycles_id: apc3.id)
k_ru3 = RoleUser.create!(user_id: kk.id, role_id: dev.id, appraisal_cycles_id: apc4.id)

s_ru1 = RoleUser.create!(user_id: sama.id, role_id: dev.id, appraisal_cycles_id: apc10.id)
s_ru2 = RoleUser.create!(user_id: sama.id, role_id: dev.id, appraisal_cycles_id: apc11.id)
s_ru3 = RoleUser.create!(user_id: sama.id, role_id: dev.id, appraisal_cycles_id: apc12.id)



 
sheet1 = KraSheet.create!(appraisal_cycle_id: apc1.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1')
sheet2 = KraSheet.create!(appraisal_cycle_id: apc2.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
sheet3 = KraSheet.create!(appraisal_cycle_id: apc3.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
sheet4 = KraSheet.create!(appraisal_cycle_id: apc4.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
sheet5 = KraSheet.create!(appraisal_cycle_id: apc5.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
sheet6 = KraSheet.create!(appraisal_cycle_id: apc6.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
sheet7 = KraSheet.create!(appraisal_cycle_id: apc7.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
sheet8 = KraSheet.create!(appraisal_cycle_id: apc8.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
sheet9 = KraSheet.create!(appraisal_cycle_id: apc9.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
sheet10 = KraSheet.create!(appraisal_cycle_id: apc10.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '0',appraisee_status: '0') 
sheet11 = KraSheet.create!(appraisal_cycle_id: apc10.id,appraisee_id: sama.id,appraiser_id: puru.id,appraiser_status: '0',appraisee_status: '0')
sheet12 = KraSheet.create!(appraisal_cycle_id: apc10.id,appraisee_id: kk.id,appraiser_id: naga.id,appraiser_status: '0',appraisee_status: '0')

rating1 = KraRating.create!(kra_sheet_id: sheet1.id, kra_attr_id: a1.id, rating: '4',comment: 'ok', rated_by: '0')
rating2 = KraRating.create!(kra_sheet_id: sheet1.id, kra_attr_id: a2.id, rating: '4',comment: 'ok', rated_by: '0')
rating3 = KraRating.create!(kra_sheet_id: sheet1.id, kra_attr_id: a3.id, rating: '4',comment: 'ok', rated_by: '0')
rating4 = KraRating.create!(kra_sheet_id: sheet1.id, kra_attr_id: a1.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
rating5 = KraRating.create!(kra_sheet_id: sheet1.id, kra_attr_id: a2.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
rating6 = KraRating.create!(kra_sheet_id: sheet1.id, kra_attr_id: a3.id, rating: '6',comment: 'you can improve in it', rated_by: '1')

rating7 = KraRating.create!(kra_sheet_id: sheet2.id, kra_attr_id: a1.id, rating: '4',comment: 'ok', rated_by: '0')
rating8 = KraRating.create!(kra_sheet_id: sheet2.id, kra_attr_id: a2.id, rating: '4',comment: 'ok', rated_by: '0')
rating9 = KraRating.create!(kra_sheet_id: sheet2.id, kra_attr_id: a3.id, rating: '4',comment: 'ok', rated_by: '0')
rating10 = KraRating.create!(kra_sheet_id: sheet2.id, kra_attr_id: a1.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
rating11 = KraRating.create!(kra_sheet_id: sheet2.id, kra_attr_id: a2.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
rating12 = KraRating.create!(kra_sheet_id: sheet2.id, kra_attr_id: a3.id, rating: '6',comment: 'you can improve in it', rated_by: '1')

rating13 = KraRating.create!(kra_sheet_id: sheet3.id, kra_attr_id: a1.id, rating: '6',comment: 'ok', rated_by: '0')
rating14 = KraRating.create!(kra_sheet_id: sheet3.id, kra_attr_id: a2.id, rating: '4',comment: 'ok', rated_by: '0')
rating15 = KraRating.create!(kra_sheet_id: sheet3.id, kra_attr_id: a3.id, rating: '6',comment: 'ok', rated_by: '0')
rating16 = KraRating.create!(kra_sheet_id: sheet3.id, kra_attr_id: a1.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
rating17 = KraRating.create!(kra_sheet_id: sheet3.id, kra_attr_id: a2.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
rating18 = KraRating.create!(kra_sheet_id: sheet3.id, kra_attr_id: a3.id, rating: '6',comment: 'you can improve in it', rated_by: '1')

rating19 = KraRating.create!(kra_sheet_id: sheet4.id, kra_attr_id: a1.id, rating: '6',comment: 'ok', rated_by: '0')
rating20 = KraRating.create!(kra_sheet_id: sheet4.id, kra_attr_id: a2.id, rating: '6',comment: 'ok', rated_by: '0')
rating21 = KraRating.create!(kra_sheet_id: sheet4.id, kra_attr_id: a3.id, rating: '6',comment: 'ok', rated_by: '0')
rating22 = KraRating.create!(kra_sheet_id: sheet4.id, kra_attr_id: a1.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
rating23 = KraRating.create!(kra_sheet_id: sheet4.id, kra_attr_id: a2.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
rating24 = KraRating.create!(kra_sheet_id: sheet4.id, kra_attr_id: a3.id, rating: '6',comment: 'you can improve in it', rated_by: '1')

rating25 = KraRating.create!(kra_sheet_id: sheet5.id, kra_attr_id: a1.id, rating: '7',comment: 'ok', rated_by: '0')
rating26 = KraRating.create!(kra_sheet_id: sheet5.id, kra_attr_id: a2.id, rating: '7',comment: 'ok', rated_by: '0')
rating27 = KraRating.create!(kra_sheet_id: sheet5.id, kra_attr_id: a3.id, rating: '7',comment: 'ok', rated_by: '0')
rating28 = KraRating.create!(kra_sheet_id: sheet5.id, kra_attr_id: a1.id, rating: '7',comment: 'fine', rated_by: '1')
rating29 = KraRating.create!(kra_sheet_id: sheet5.id, kra_attr_id: a2.id, rating: '7',comment: 'fine', rated_by: '1')
rating30 = KraRating.create!(kra_sheet_id: sheet5.id, kra_attr_id: a3.id, rating: '7',comment: 'fine', rated_by: '1')

rating31 = KraRating.create!(kra_sheet_id: sheet6.id, kra_attr_id: a1.id, rating: '7',comment: 'ok', rated_by: '0')
rating32 = KraRating.create!(kra_sheet_id: sheet6.id, kra_attr_id: a2.id, rating: '5',comment: 'ok', rated_by: '0')
rating33 = KraRating.create!(kra_sheet_id: sheet6.id, kra_attr_id: a3.id, rating: '5',comment: 'ok', rated_by: '0')
rating34 = KraRating.create!(kra_sheet_id: sheet6.id, kra_attr_id: a1.id, rating: '7',comment: 'fine', rated_by: '1')
rating35 = KraRating.create!(kra_sheet_id: sheet6.id, kra_attr_id: a2.id, rating: '7',comment: 'fine', rated_by: '1')
rating36 = KraRating.create!(kra_sheet_id: sheet6.id, kra_attr_id: a3.id, rating: '7',comment: 'fine', rated_by: '1')

rating37 = KraRating.create!(kra_sheet_id: sheet7.id, kra_attr_id: a1.id, rating: '5',comment: 'ok', rated_by: '0')
rating38 = KraRating.create!(kra_sheet_id: sheet7.id, kra_attr_id: a2.id, rating: '5',comment: 'ok', rated_by: '0')
rating39 = KraRating.create!(kra_sheet_id: sheet7.id, kra_attr_id: a3.id, rating: '5',comment: 'ok', rated_by: '0')
rating40 = KraRating.create!(kra_sheet_id: sheet7.id, kra_attr_id: a1.id, rating: '7',comment: 'fine', rated_by: '1')
rating41 = KraRating.create!(kra_sheet_id: sheet7.id, kra_attr_id: a2.id, rating: '7',comment: 'fine', rated_by: '1')
rating42 = KraRating.create!(kra_sheet_id: sheet7.id, kra_attr_id: a3.id, rating: '7',comment: 'fine', rated_by: '1')

rating43 = KraRating.create!(kra_sheet_id: sheet8.id, kra_attr_id: a1.id, rating: '8',comment: 'ok', rated_by: '0')
rating44 = KraRating.create!(kra_sheet_id: sheet8.id, kra_attr_id: a2.id, rating: '8',comment: 'ok', rated_by: '0')
rating45 = KraRating.create!(kra_sheet_id: sheet8.id, kra_attr_id: a3.id, rating: '8',comment: 'ok', rated_by: '0')
rating46 = KraRating.create!(kra_sheet_id: sheet8.id, kra_attr_id: a1.id, rating: '8',comment: 'good', rated_by: '1')
rating47 = KraRating.create!(kra_sheet_id: sheet8.id, kra_attr_id: a2.id, rating: '8',comment: 'good', rated_by: '1')
rating48 = KraRating.create!(kra_sheet_id: sheet8.id, kra_attr_id: a3.id, rating: '8',comment: 'good', rated_by: '1')

rating49 = KraRating.create!(kra_sheet_id: sheet9.id, kra_attr_id: a1.id, rating: '8',comment: 'ok', rated_by: '0')
rating50 = KraRating.create!(kra_sheet_id: sheet9.id, kra_attr_id: a2.id, rating: '8',comment: 'ok', rated_by: '0')
rating51 = KraRating.create!(kra_sheet_id: sheet9.id, kra_attr_id: a3.id, rating: '8',comment: 'ok', rated_by: '0')
rating52 = KraRating.create!(kra_sheet_id: sheet9.id, kra_attr_id: a1.id, rating: '9',comment: 'good', rated_by: '1')
rating53 = KraRating.create!(kra_sheet_id: sheet9.id, kra_attr_id: a2.id, rating: '9',comment: 'good', rated_by: '1')
rating54 = KraRating.create!(kra_sheet_id: sheet9.id, kra_attr_id: a3.id, rating: '9',comment: 'good', rated_by: '1')



dr_sheet1 = DrSheet.create!(appraisal_cycle_id: apc1.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1')
dr_sheet2 = DrSheet.create!(appraisal_cycle_id: apc2.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
dr_sheet3 = DrSheet.create!(appraisal_cycle_id: apc3.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
dr_sheet4 = DrSheet.create!(appraisal_cycle_id: apc4.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
dr_sheet5 = DrSheet.create!(appraisal_cycle_id: apc5.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
dr_sheet6 = DrSheet.create!(appraisal_cycle_id: apc6.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
dr_sheet7 = DrSheet.create!(appraisal_cycle_id: apc7.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
dr_sheet8 = DrSheet.create!(appraisal_cycle_id: apc8.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
dr_sheet9 = DrSheet.create!(appraisal_cycle_id: apc9.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '1',appraisee_status: '1') 
dr_sheet10 = DrSheet.create!(appraisal_cycle_id: apc10.id,appraisee_id: puru.id,appraiser_id: rama.id,appraiser_status: '0',appraisee_status: '0') 
dr_sheet11 = DrSheet.create!(appraisal_cycle_id: apc10.id,appraisee_id: sama.id,appraiser_id: puru.id,appraiser_status: '0',appraisee_status: '0')
dr_sheet12 = DrSheet.create!(appraisal_cycle_id: apc10.id,appraisee_id: kk.id,appraiser_id: naga.id,appraiser_status: '0',appraisee_status: '0')


dr_rating1 = DrRating.create!(dr_sheet_id: dr_sheet1.id, dr_attr_id: dr1.id, rating: '4',comment: 'ok', rated_by: '0')
dr_rating2 = DrRating.create!(dr_sheet_id: dr_sheet1.id, dr_attr_id: dr2.id, rating: '4',comment: 'ok', rated_by: '0')
dr_rating3 = DrRating.create!(dr_sheet_id: dr_sheet1.id, dr_attr_id: dr3.id, rating: '4',comment: 'ok', rated_by: '0')
dr_rating55= DrRating.create!(dr_sheet_id: dr_sheet1.id, dr_attr_id: dr4.id, rating: '4',comment: 'ok', rated_by: '0')
dr_rating56= DrRating.create!(dr_sheet_id: dr_sheet1.id, dr_attr_id: dr5.id, rating: '4',comment: 'ok', rated_by: '0')
dr_rating57= DrRating.create!(dr_sheet_id: dr_sheet1.id, dr_attr_id: dr6.id, rating: '4',comment: 'ok', rated_by: '0')

dr_rating4 = DrRating.create!(dr_sheet_id: dr_sheet1.id, dr_attr_id: dr1.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating5 = DrRating.create!(dr_sheet_id: dr_sheet1.id, dr_attr_id: dr2.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating6 = DrRating.create!(dr_sheet_id: dr_sheet1.id, dr_attr_id: dr3.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating58 =DrRating.create!(dr_sheet_id: dr_sheet1.id, dr_attr_id: dr4.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating59 =DrRating.create!(dr_sheet_id: dr_sheet1.id, dr_attr_id: dr5.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating60 =DrRating.create!(dr_sheet_id: dr_sheet1.id, dr_attr_id: dr6.id, rating: '6',comment: 'you can improve in it', rated_by: '1')


dr_rating7 = DrRating.create!(dr_sheet_id: dr_sheet2.id, dr_attr_id: dr1.id, rating: '4',comment: 'ok', rated_by: '0')
dr_rating8 = DrRating.create!(dr_sheet_id: dr_sheet2.id, dr_attr_id: dr2.id, rating: '4',comment: 'ok', rated_by: '0')
dr_rating9 = DrRating.create!(dr_sheet_id: dr_sheet2.id, dr_attr_id: dr3.id, rating: '4',comment: 'ok', rated_by: '0')
dr_rating10 = DrRating.create!(dr_sheet_id: dr_sheet2.id, dr_attr_id: dr1.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating11 = DrRating.create!(dr_sheet_id: dr_sheet2.id, dr_attr_id: dr2.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating12 = DrRating.create!(dr_sheet_id: dr_sheet2.id, dr_attr_id: dr3.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating61 = DrRating.create!(dr_sheet_id: dr_sheet2.id, dr_attr_id: dr4.id, rating: '4',comment: 'ok', rated_by: '0')
dr_rating62 = DrRating.create!(dr_sheet_id: dr_sheet2.id, dr_attr_id: dr5.id, rating: '4',comment: 'ok', rated_by: '0')
dr_rating63 = DrRating.create!(dr_sheet_id: dr_sheet2.id, dr_attr_id: dr6.id, rating: '4',comment: 'ok', rated_by: '0')
dr_rating64 = DrRating.create!(dr_sheet_id: dr_sheet2.id, dr_attr_id: dr4.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating65 = DrRating.create!(dr_sheet_id: dr_sheet2.id, dr_attr_id: dr5.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating66 = DrRating.create!(dr_sheet_id: dr_sheet2.id, dr_attr_id: dr6.id, rating: '6',comment: 'you can improve in it', rated_by: '1')

dr_rating13 = DrRating.create!(dr_sheet_id: dr_sheet3.id, dr_attr_id: dr1.id, rating: '6',comment: 'ok', rated_by: '0')
dr_rating14 = DrRating.create!(dr_sheet_id: dr_sheet3.id, dr_attr_id: dr2.id, rating: '4',comment: 'ok', rated_by: '0')
dr_rating15 = DrRating.create!(dr_sheet_id: dr_sheet3.id, dr_attr_id: dr3.id, rating: '6',comment: 'ok', rated_by: '0')
dr_rating16 = DrRating.create!(dr_sheet_id: dr_sheet3.id, dr_attr_id: dr1.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating17 = DrRating.create!(dr_sheet_id: dr_sheet3.id, dr_attr_id: dr2.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating18 = DrRating.create!(dr_sheet_id: dr_sheet3.id, dr_attr_id: dr3.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating67 = DrRating.create!(dr_sheet_id: dr_sheet3.id, dr_attr_id: dr4.id, rating: '6',comment: 'ok', rated_by: '0')
dr_rating68 = DrRating.create!(dr_sheet_id: dr_sheet3.id, dr_attr_id: dr5.id, rating: '4',comment: 'ok', rated_by: '0')
dr_rating69 = DrRating.create!(dr_sheet_id: dr_sheet3.id, dr_attr_id: dr6.id, rating: '6',comment: 'ok', rated_by: '0')
dr_rating70 = DrRating.create!(dr_sheet_id: dr_sheet3.id, dr_attr_id: dr4.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating71 = DrRating.create!(dr_sheet_id: dr_sheet3.id, dr_attr_id: dr5.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating72 = DrRating.create!(dr_sheet_id: dr_sheet3.id, dr_attr_id: dr6.id, rating: '6',comment: 'you can improve in it', rated_by: '1')

dr_rating19 = DrRating.create!(dr_sheet_id: dr_sheet4.id, dr_attr_id: dr1.id, rating: '6',comment: 'ok', rated_by: '0')
dr_rating20 = DrRating.create!(dr_sheet_id: dr_sheet4.id, dr_attr_id: dr2.id, rating: '6',comment: 'ok', rated_by: '0')
dr_rating21 = DrRating.create!(dr_sheet_id: dr_sheet4.id, dr_attr_id: dr3.id, rating: '6',comment: 'ok', rated_by: '0')
dr_rating22 = DrRating.create!(dr_sheet_id: dr_sheet4.id, dr_attr_id: dr1.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating23 = DrRating.create!(dr_sheet_id: dr_sheet4.id, dr_attr_id: dr2.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating24 = DrRating.create!(dr_sheet_id: dr_sheet4.id, dr_attr_id: dr3.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating73 = DrRating.create!(dr_sheet_id: dr_sheet4.id, dr_attr_id: dr4.id, rating: '6',comment: 'ok', rated_by: '0')
dr_rating74 = DrRating.create!(dr_sheet_id: dr_sheet4.id, dr_attr_id: dr5.id, rating: '6',comment: 'ok', rated_by: '0')
dr_rating75 = DrRating.create!(dr_sheet_id: dr_sheet4.id, dr_attr_id: dr6.id, rating: '6',comment: 'ok', rated_by: '0')
dr_rating76 = DrRating.create!(dr_sheet_id: dr_sheet4.id, dr_attr_id: dr4.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating77 = DrRating.create!(dr_sheet_id: dr_sheet4.id, dr_attr_id: dr5.id, rating: '6',comment: 'you can improve in it', rated_by: '1')
dr_rating78 = DrRating.create!(dr_sheet_id: dr_sheet4.id, dr_attr_id: dr6.id, rating: '6',comment: 'you can improve in it', rated_by: '1')

dr_rating25 = DrRating.create!(dr_sheet_id: dr_sheet5.id, dr_attr_id: dr1.id, rating: '7',comment: 'ok', rated_by: '0')
dr_rating26 = DrRating.create!(dr_sheet_id: dr_sheet5.id, dr_attr_id: dr2.id, rating: '7',comment: 'ok', rated_by: '0')
dr_rating27 = DrRating.create!(dr_sheet_id: dr_sheet5.id, dr_attr_id: dr3.id, rating: '7',comment: 'ok', rated_by: '0')
dr_rating28 = DrRating.create!(dr_sheet_id: dr_sheet5.id, dr_attr_id: dr1.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating29 = DrRating.create!(dr_sheet_id: dr_sheet5.id, dr_attr_id: dr2.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating30 = DrRating.create!(dr_sheet_id: dr_sheet5.id, dr_attr_id: dr3.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating79 = DrRating.create!(dr_sheet_id: dr_sheet5.id, dr_attr_id: dr4.id, rating: '7',comment: 'ok', rated_by: '0')
dr_rating80 = DrRating.create!(dr_sheet_id: dr_sheet5.id, dr_attr_id: dr5.id, rating: '7',comment: 'ok', rated_by: '0')
dr_rating81 = DrRating.create!(dr_sheet_id: dr_sheet5.id, dr_attr_id: dr6.id, rating: '7',comment: 'ok', rated_by: '0')
dr_rating82 = DrRating.create!(dr_sheet_id: dr_sheet5.id, dr_attr_id: dr4.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating83 = DrRating.create!(dr_sheet_id: dr_sheet5.id, dr_attr_id: dr5.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating84 = DrRating.create!(dr_sheet_id: dr_sheet5.id, dr_attr_id: dr6.id, rating: '7',comment: 'fine', rated_by: '1')

dr_rating31 = DrRating.create!(dr_sheet_id: dr_sheet6.id, dr_attr_id: dr1.id, rating: '7',comment: 'ok', rated_by: '0')
dr_rating32 = DrRating.create!(dr_sheet_id: dr_sheet6.id, dr_attr_id: dr2.id, rating: '5',comment: 'ok', rated_by: '0')
dr_rating33 = DrRating.create!(dr_sheet_id: dr_sheet6.id, dr_attr_id: dr3.id, rating: '5',comment: 'ok', rated_by: '0')
dr_rating34 = DrRating.create!(dr_sheet_id: dr_sheet6.id, dr_attr_id: dr1.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating35 = DrRating.create!(dr_sheet_id: dr_sheet6.id, dr_attr_id: dr2.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating36 = DrRating.create!(dr_sheet_id: dr_sheet6.id, dr_attr_id: dr3.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating85 = DrRating.create!(dr_sheet_id: dr_sheet6.id, dr_attr_id: dr4.id, rating: '7',comment: 'ok', rated_by: '0')
dr_rating86 = DrRating.create!(dr_sheet_id: dr_sheet6.id, dr_attr_id: dr5.id, rating: '5',comment: 'ok', rated_by: '0')
dr_rating87 = DrRating.create!(dr_sheet_id: dr_sheet6.id, dr_attr_id: dr6.id, rating: '5',comment: 'ok', rated_by: '0')
dr_rating88 = DrRating.create!(dr_sheet_id: dr_sheet6.id, dr_attr_id: dr4.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating89 = DrRating.create!(dr_sheet_id: dr_sheet6.id, dr_attr_id: dr5.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating90 = DrRating.create!(dr_sheet_id: dr_sheet6.id, dr_attr_id: dr6.id, rating: '7',comment: 'fine', rated_by: '1')

dr_rating37 = DrRating.create!(dr_sheet_id: dr_sheet7.id, dr_attr_id: dr1.id, rating: '5',comment: 'ok', rated_by: '0')
dr_rating38 = DrRating.create!(dr_sheet_id: dr_sheet7.id, dr_attr_id: dr2.id, rating: '5',comment: 'ok', rated_by: '0')
dr_rating39 = DrRating.create!(dr_sheet_id: dr_sheet7.id, dr_attr_id: dr3.id, rating: '5',comment: 'ok', rated_by: '0')
dr_rating40 = DrRating.create!(dr_sheet_id: dr_sheet7.id, dr_attr_id: dr1.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating41 = DrRating.create!(dr_sheet_id: dr_sheet7.id, dr_attr_id: dr2.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating42 = DrRating.create!(dr_sheet_id: dr_sheet7.id, dr_attr_id: dr3.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating91 = DrRating.create!(dr_sheet_id: dr_sheet7.id, dr_attr_id: dr4.id, rating: '5',comment: 'ok', rated_by: '0')
dr_rating92 = DrRating.create!(dr_sheet_id: dr_sheet7.id, dr_attr_id: dr5.id, rating: '5',comment: 'ok', rated_by: '0')
dr_rating92 = DrRating.create!(dr_sheet_id: dr_sheet7.id, dr_attr_id: dr6.id, rating: '5',comment: 'ok', rated_by: '0')
dr_rating93 = DrRating.create!(dr_sheet_id: dr_sheet7.id, dr_attr_id: dr4.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating94 = DrRating.create!(dr_sheet_id: dr_sheet7.id, dr_attr_id: dr5.id, rating: '7',comment: 'fine', rated_by: '1')
dr_rating95 = DrRating.create!(dr_sheet_id: dr_sheet7.id, dr_attr_id: dr6.id, rating: '7',comment: 'fine', rated_by: '1')

dr_rating43 = DrRating.create!(dr_sheet_id: dr_sheet8.id, dr_attr_id: dr1.id, rating: '8',comment: 'ok', rated_by: '0')
dr_rating44 = DrRating.create!(dr_sheet_id: dr_sheet8.id, dr_attr_id: dr2.id, rating: '8',comment: 'ok', rated_by: '0')
dr_rating45 = DrRating.create!(dr_sheet_id: dr_sheet8.id, dr_attr_id: dr3.id, rating: '8',comment: 'ok', rated_by: '0')
dr_rating46 = DrRating.create!(dr_sheet_id: dr_sheet8.id, dr_attr_id: dr1.id, rating: '8',comment: 'good', rated_by: '1')
dr_rating47 = DrRating.create!(dr_sheet_id: dr_sheet8.id, dr_attr_id: dr2.id, rating: '8',comment: 'good', rated_by: '1')
dr_rating48 = DrRating.create!(dr_sheet_id: dr_sheet8.id, dr_attr_id: dr3.id, rating: '8',comment: 'good', rated_by: '1')
dr_rating96 = DrRating.create!(dr_sheet_id: dr_sheet8.id, dr_attr_id: dr4.id, rating: '8',comment: 'ok', rated_by: '0')
dr_rating97 = DrRating.create!(dr_sheet_id: dr_sheet8.id, dr_attr_id: dr5.id, rating: '8',comment: 'ok', rated_by: '0')
dr_rating98 = DrRating.create!(dr_sheet_id: dr_sheet8.id, dr_attr_id: dr6.id, rating: '8',comment: 'ok', rated_by: '0')
dr_rating99 = DrRating.create!(dr_sheet_id: dr_sheet8.id, dr_attr_id: dr4.id, rating: '8',comment: 'good', rated_by: '1')
dr_rating100 = DrRating.create!(dr_sheet_id: dr_sheet8.id, dr_attr_id: dr5.id, rating: '8',comment: 'good', rated_by: '1')
dr_rating101 = DrRating.create!(dr_sheet_id: dr_sheet8.id, dr_attr_id: dr6.id, rating: '8',comment: 'good', rated_by: '1')

dr_rating49 = DrRating.create!(dr_sheet_id: dr_sheet9.id, dr_attr_id: dr1.id, rating: '8',comment: 'ok', rated_by: '0')
dr_rating50 = DrRating.create!(dr_sheet_id: dr_sheet9.id, dr_attr_id: dr2.id, rating: '8',comment: 'ok', rated_by: '0')
dr_rating51 = DrRating.create!(dr_sheet_id: dr_sheet9.id, dr_attr_id: dr3.id, rating: '8',comment: 'ok', rated_by: '0')
dr_rating52 = DrRating.create!(dr_sheet_id: dr_sheet9.id, dr_attr_id: dr1.id, rating: '9',comment: 'good', rated_by: '1')
dr_rating53 = DrRating.create!(dr_sheet_id: dr_sheet9.id, dr_attr_id: dr2.id, rating: '9',comment: 'good', rated_by: '1')
dr_rating54 = DrRating.create!(dr_sheet_id: dr_sheet9.id, dr_attr_id: dr3.id, rating: '9',comment: 'good', rated_by: '1')
dr_rating102 = DrRating.create!(dr_sheet_id: dr_sheet9.id, dr_attr_id: dr4.id, rating: '8',comment: 'ok', rated_by: '0')
dr_rating103 = DrRating.create!(dr_sheet_id: dr_sheet9.id, dr_attr_id: dr5.id, rating: '8',comment: 'ok', rated_by: '0')
dr_rating104 = DrRating.create!(dr_sheet_id: dr_sheet9.id, dr_attr_id: dr6.id, rating: '8',comment: 'ok', rated_by: '0')
dr_rating105 = DrRating.create!(dr_sheet_id: dr_sheet9.id, dr_attr_id: dr4.id, rating: '9',comment: 'good', rated_by: '1')
dr_rating106 = DrRating.create!(dr_sheet_id: dr_sheet9.id, dr_attr_id: dr5.id, rating: '9',comment: 'good', rated_by: '1')
dr_rating107 = DrRating.create!(dr_sheet_id: dr_sheet9.id, dr_attr_id: dr6.id, rating: '9',comment: 'good', rated_by: '1')
