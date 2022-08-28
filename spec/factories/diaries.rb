FactoryBot.define do
  factory :diary, class: Diary do
    sequence(:title) { |i| "Diary_#{i}" }
    body {"lorem ipsum"}

    user
  end
end
