targetperson.seed_once do |s|
  s.id = 1
  s.target = 'きれい好きな人'
end

TargetPerson.seed do |s|
  s.id = 2
  s.target = 'おしゃれが好きな女性'
end

TargetPerson.seed do |s|
  s.id = 3
  s.target = '小さなお子さん連れの女性'
end
