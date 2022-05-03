Given(/the default settings/) do
  default_settings = {
    airtable_base_id: 'appBVUbGPToiaKXQK',
    users_table_id: 'tblUm0begj9P1Jz8J',
    tasks_table_id: 'tblK100SDUB0m1KU5',
    announcements_table_id: 'tblgi0d7vY2OCauSw',
  }
  @setting = Setting.create(default_settings)
  @setting.password = 'ilovebfc'
  @setting.save!
end