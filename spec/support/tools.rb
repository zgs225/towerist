# encoding: utf-8

def root
  File.expand_path '../../../', __FILE__
end

def generate_data_source
  Towerist::DataSource.new(File.expand_path('data/source/tower.html', root))
end
