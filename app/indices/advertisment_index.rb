ThinkingSphinx::Index.define :advertisment, :with => :active_record do
  indexes title
  indexes body
  indexes type.name, as: :type
  indexes state
  has user.id, as: :user
end