FactoryGirl.define do
  sequence :number do |n|
    "#{n}"
  end

  factory :regular_user, class: User do
    id {1}
    email {'user@mctiny.test'}
    password {'xyzzyuiop'}
    admin {false}
  end

  factory :admin_user, class: User do
    id {2}
    email {'admin@mctiny.test'}
    password {'xyzzyuiop'}
    admin {true}
  end

  factory :mystery, class: Question do
    user_id {1}
    id {1}
    description {'Mysteries'}
    query {'mysteries'}
    googled_at {nil}
  end

  factory :revelation, class: Question do
    user_id {1}
    id {2}
    description {'Revelation'}
    query {'revelation'}
    googled_at {nil}
  end
end
