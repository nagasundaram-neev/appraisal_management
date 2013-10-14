# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

atr= KraAttr.create!(name: 'a',weightage: '30',desc: 'fdasfasdf',measures: 'fadsfasf')
a1= KraAttr.create!(name: 'a1',weightage: '40',desc: 'fdasfasdf',measures: 'fadsfasf')
a2= KraAttr.create!(name: 'a2',weightage: '50',desc: 'fdasfasdf',measures: 'fadsfasf')
a3= KraAttr.create!(name: 'a3',weightage: '10',desc: 'fdasfasdf',measures: 'fadsfasf')
a4= KraAttr.create!(name: 'a4',weightage: '20',desc: 'fdasfasdf',measures: 'fadsfasf')
a5= KraAttr.create!(name: 'a5',weightage: '35',desc: 'fdasfasdf',measures: 'fadsfasf')
a6= KraAttr.create!(name: 'a6',weightage: '25',desc: 'fdasfasdf',measures: 'fadsfasf')
a7= KraAttr.create!(name: 'a7',weightage: '40',desc: 'fdasfasdf',measures: 'fadsfasf')



dev = Role.create!(name: 'dev')
sdev = Role.create!(name: 'sdev')
pmgr = Role.create!(name: 'pmgr')
tlead = Role.create!(name: 'tlead')
ceo = Role.create!(name: 'ceo')


r_atr = KraRoleAttr.create!(kra_attr_id: a2.id, role_id: dev.id)
r_atr1 = KraRoleAttr.create!(kra_attr_id: a4.id, role_id: dev.id)
r_atr2 = KraRoleAttr.create!(kra_attr_id: a5.id, role_id: dev.id)

r_atr3 = KraRoleAttr.create!(kra_attr_id: a5.id, role_id: sdev.id)
r_atr4 = KraRoleAttr.create!(kra_attr_id: a6.id, role_id: sdev.id)
r_atr5 = KraRoleAttr.create!(kra_attr_id: a7.id, role_id: sdev.id)

r_atr6 = KraRoleAttr.create!(kra_attr_id: a1.id, role_id: pmgr.id)
r_atr7 = KraRoleAttr.create!(kra_attr_id: a5.id, role_id: pmgr.id)
r_atr8 = KraRoleAttr.create!(kra_attr_id: a6.id, role_id: pmgr.id)

r_atr9 = KraRoleAttr.create!(kra_attr_id: a1.id, role_id: tlead.id)
r_atr10 = KraRoleAttr.create!(kra_attr_id: a5.id, role_id: tlead.id)
r_atr11 = KraRoleAttr.create!(kra_attr_id: a6.id, role_id: tlead.id)

r_atr12 = KraRoleAttr.create!(kra_attr_id: a1.id, role_id: ceo.id)
r_atr13 = KraRoleAttr.create!(kra_attr_id: a5.id, role_id: ceo.id)
r_atr14 = KraRoleAttr.create!(kra_attr_id: a6.id, role_id: ceo.id)

dept = Department.create!(name: 'BU1')
dept1 = Department.create!(name: 'BU3')
dept2 = Department.create!(name: 'BU2')
dept2 = Department.create!(name: 'BU4')
dept2 = Department.create!(name: 'BU5')



admin= User.create!(email: 'admin@neevtech.com', password: '12345678', first_name: 'admin', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'admin')
puru= User.create!(email: 'puru@neevtech.com', password: '12345678', first_name: 'puru_aprsr', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraiser')

naga= User.create!(email: 'naga@neevtech.com', password: '12345678', first_name: 'naga_aprsr', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraiser')
rama= User.create!(email: 'rama@neevtech.com', password: '12345678', first_name: 'rama_aprsr', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraiser')
ali= User.create!(email: 'ali@neevtech.com', password: '12345678', first_name: 'ali_aprsr', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraiser')
kk= User.create!(email: 'kk@neevtech.com', password: '12345678', first_name: 'kk_appraisee', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraisee')
sama= User.create!(email: 'sama@neevtech.com', password: '12345678', first_name: 'sama_appraisee', last_name: 'neev', gender: 'M' ,phone_no: '+919999999999', role: 'appraisee')





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
rating4 = KraRating.create!(kra_sheet_id: sheet1.id, kra_attr_id: a1.id, rating: '6',comment: 'ok', rated_by: '1')
rating5 = KraRating.create!(kra_sheet_id: sheet1.id, kra_attr_id: a2.id, rating: '6',comment: 'ok', rated_by: '1')
rating6 = KraRating.create!(kra_sheet_id: sheet1.id, kra_attr_id: a3.id, rating: '6',comment: 'ok', rated_by: '1')

rating7 = KraRating.create!(kra_sheet_id: sheet2.id, kra_attr_id: a1.id, rating: '4',comment: 'ok', rated_by: '0')
rating8 = KraRating.create!(kra_sheet_id: sheet2.id, kra_attr_id: a2.id, rating: '4',comment: 'ok', rated_by: '0')
rating9 = KraRating.create!(kra_sheet_id: sheet2.id, kra_attr_id: a3.id, rating: '4',comment: 'ok', rated_by: '0')
rating10 = KraRating.create!(kra_sheet_id: sheet2.id, kra_attr_id: a1.id, rating: '6',comment: 'ok', rated_by: '1')
rating11 = KraRating.create!(kra_sheet_id: sheet2.id, kra_attr_id: a2.id, rating: '6',comment: 'ok', rated_by: '1')
rating12 = KraRating.create!(kra_sheet_id: sheet2.id, kra_attr_id: a3.id, rating: '6',comment: 'ok', rated_by: '1')

rating13 = KraRating.create!(kra_sheet_id: sheet3.id, kra_attr_id: a1.id, rating: '6',comment: 'ok', rated_by: '0')
rating14 = KraRating.create!(kra_sheet_id: sheet3.id, kra_attr_id: a2.id, rating: '4',comment: 'ok', rated_by: '0')
rating15 = KraRating.create!(kra_sheet_id: sheet3.id, kra_attr_id: a3.id, rating: '6',comment: 'ok', rated_by: '0')
rating16 = KraRating.create!(kra_sheet_id: sheet3.id, kra_attr_id: a1.id, rating: '6',comment: 'ok', rated_by: '1')
rating17 = KraRating.create!(kra_sheet_id: sheet3.id, kra_attr_id: a2.id, rating: '6',comment: 'ok', rated_by: '1')
rating18 = KraRating.create!(kra_sheet_id: sheet3.id, kra_attr_id: a3.id, rating: '6',comment: 'ok', rated_by: '1')

rating19 = KraRating.create!(kra_sheet_id: sheet4.id, kra_attr_id: a1.id, rating: '6',comment: 'ok', rated_by: '0')
rating20 = KraRating.create!(kra_sheet_id: sheet4.id, kra_attr_id: a2.id, rating: '6',comment: 'ok', rated_by: '0')
rating21 = KraRating.create!(kra_sheet_id: sheet4.id, kra_attr_id: a3.id, rating: '6',comment: 'ok', rated_by: '0')
rating22 = KraRating.create!(kra_sheet_id: sheet4.id, kra_attr_id: a1.id, rating: '6',comment: 'ok', rated_by: '1')
rating23 = KraRating.create!(kra_sheet_id: sheet4.id, kra_attr_id: a2.id, rating: '6',comment: 'ok', rated_by: '1')
rating24 = KraRating.create!(kra_sheet_id: sheet4.id, kra_attr_id: a3.id, rating: '6',comment: 'ok', rated_by: '1')

rating25 = KraRating.create!(kra_sheet_id: sheet5.id, kra_attr_id: a1.id, rating: '7',comment: 'ok', rated_by: '0')
rating26 = KraRating.create!(kra_sheet_id: sheet5.id, kra_attr_id: a2.id, rating: '7',comment: 'ok', rated_by: '0')
rating27 = KraRating.create!(kra_sheet_id: sheet5.id, kra_attr_id: a3.id, rating: '7',comment: 'ok', rated_by: '0')
rating28 = KraRating.create!(kra_sheet_id: sheet5.id, kra_attr_id: a1.id, rating: '7',comment: 'ok', rated_by: '1')
rating29 = KraRating.create!(kra_sheet_id: sheet5.id, kra_attr_id: a2.id, rating: '7',comment: 'ok', rated_by: '1')
rating30 = KraRating.create!(kra_sheet_id: sheet5.id, kra_attr_id: a3.id, rating: '7',comment: 'ok', rated_by: '1')

rating31 = KraRating.create!(kra_sheet_id: sheet6.id, kra_attr_id: a1.id, rating: '7',comment: 'ok', rated_by: '0')
rating32 = KraRating.create!(kra_sheet_id: sheet6.id, kra_attr_id: a2.id, rating: '5',comment: 'ok', rated_by: '0')
rating33 = KraRating.create!(kra_sheet_id: sheet6.id, kra_attr_id: a3.id, rating: '5',comment: 'ok', rated_by: '0')
rating34 = KraRating.create!(kra_sheet_id: sheet6.id, kra_attr_id: a1.id, rating: '7',comment: 'ok', rated_by: '1')
rating35 = KraRating.create!(kra_sheet_id: sheet6.id, kra_attr_id: a2.id, rating: '7',comment: 'ok', rated_by: '1')
rating36 = KraRating.create!(kra_sheet_id: sheet6.id, kra_attr_id: a3.id, rating: '7',comment: 'ok', rated_by: '1')

rating37 = KraRating.create!(kra_sheet_id: sheet7.id, kra_attr_id: a1.id, rating: '5',comment: 'ok', rated_by: '0')
rating38 = KraRating.create!(kra_sheet_id: sheet7.id, kra_attr_id: a2.id, rating: '5',comment: 'ok', rated_by: '0')
rating39 = KraRating.create!(kra_sheet_id: sheet7.id, kra_attr_id: a3.id, rating: '5',comment: 'ok', rated_by: '0')
rating40 = KraRating.create!(kra_sheet_id: sheet7.id, kra_attr_id: a1.id, rating: '7',comment: 'ok', rated_by: '1')
rating41 = KraRating.create!(kra_sheet_id: sheet7.id, kra_attr_id: a2.id, rating: '7',comment: 'ok', rated_by: '1')
rating42 = KraRating.create!(kra_sheet_id: sheet7.id, kra_attr_id: a3.id, rating: '7',comment: 'ok', rated_by: '1')

rating43 = KraRating.create!(kra_sheet_id: sheet8.id, kra_attr_id: a1.id, rating: '8',comment: 'ok', rated_by: '0')
rating44 = KraRating.create!(kra_sheet_id: sheet8.id, kra_attr_id: a2.id, rating: '8',comment: 'ok', rated_by: '0')
rating45 = KraRating.create!(kra_sheet_id: sheet8.id, kra_attr_id: a3.id, rating: '8',comment: 'ok', rated_by: '0')
rating46 = KraRating.create!(kra_sheet_id: sheet8.id, kra_attr_id: a1.id, rating: '8',comment: 'ok', rated_by: '1')
rating47 = KraRating.create!(kra_sheet_id: sheet8.id, kra_attr_id: a2.id, rating: '8',comment: 'ok', rated_by: '1')
rating48 = KraRating.create!(kra_sheet_id: sheet8.id, kra_attr_id: a3.id, rating: '8',comment: 'ok', rated_by: '1')

rating49 = KraRating.create!(kra_sheet_id: sheet9.id, kra_attr_id: a1.id, rating: '8',comment: 'ok', rated_by: '0')
rating50 = KraRating.create!(kra_sheet_id: sheet9.id, kra_attr_id: a2.id, rating: '8',comment: 'ok', rated_by: '0')
rating51 = KraRating.create!(kra_sheet_id: sheet9.id, kra_attr_id: a3.id, rating: '8',comment: 'ok', rated_by: '0')
rating52 = KraRating.create!(kra_sheet_id: sheet9.id, kra_attr_id: a1.id, rating: '9',comment: 'ok', rated_by: '1')
rating53 = KraRating.create!(kra_sheet_id: sheet9.id, kra_attr_id: a2.id, rating: '9',comment: 'ok', rated_by: '1')
rating54 = KraRating.create!(kra_sheet_id: sheet9.id, kra_attr_id: a3.id, rating: '9',comment: 'ok', rated_by: '1')


