set :environment, 'development'

every :day, at: '0:00am' do
  rake 'advertisment:publish'
end

every :day, at: '11:30pm' do
  rake 'advertisment:archive'
end
