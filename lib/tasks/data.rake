namespace :data do
  desc "import data from files to database"
  task :import => :environment do
    file = File.open("./lib/tasks/brand_sizes")
    is_brand = true
    brand = nil
    file.each do |line|
      if line.blank?
        is_brand = true
        next
      end

      attrs = line.split("\t")
      
      if is_brand
        brand = Brand.find_by(name:attrs[0])
        if brand.nil?
          brand = Brand.create(name: attrs[0], website: attrs[2],
                               country: attrs[1])
          brand.save!
        end
        is_brand = false
      else
        brand_size = BrandSize.create(size: attrs[0], bust: attrs[1],
                                      waist: attrs[2], hip: attrs[3],
                                      brand_id: brand.id, legend: attrs[4])
        brand_size.save!
      end
    end
  end
end
