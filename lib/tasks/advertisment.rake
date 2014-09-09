namespace :advertisment do
  desc "Publish an advertisment"
  task publish: :environment do
    @ads=Advertisment.where(state:"approved")
    @ads.each do |f|
      f.publish
    end
  end

  desc "Archive an advertisment"
  task archive: :environment do
    @ads=Advertisment.where("updated_at <= ? AND state = 'published'", Date.today - 3.days)
    @ads.each do |f|
      f.archive
    end
  end

end
