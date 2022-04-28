Given(/the default settings/) do
  default_settings = {
    airtable_base_id: 'appzTTr4CrP8jSSQY',
    users_table_id: 'tbl1SuoIW99KUjDMx',
    tasks_table_id: 'tblwRWq2x609uUzOv',
    announcements_table_id: 'tblI0sVfVCRN7Wwla',
  }
  Setting.create(default_settings)
end