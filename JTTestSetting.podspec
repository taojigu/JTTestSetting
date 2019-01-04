Pod::Spec.new do |s|
    s.name         = 'JTTestSetting'
    s.version      = '0.0.1'
    s.summary      = 'Test setting UI'
    s.homepage     = 'https://github.com/CoderMJLee/MJRefresh'
    s.license      = 'MIT'
    s.authors      = {'Gujitao' => 'taojigu@163.com'}
    s.platform     = :ios, '6.0'
    s.source       = {:git => 'https://github.com/taojigu/JTTestSetting', :tag => s.version}
    s.source_files = 'Class/**/*.{h,m}'
    s.requires_arc = true

    s.dependency 'YYCache'
    s.dependency 'MJExtension'
    s.dependency 'Masonry'
    s.dependency 'UITableView+FDTemplateLayoutCell'

end
