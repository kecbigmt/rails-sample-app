FactoryBot.define do
  factory :user, class: User do
    transient do
      sequence(:name_is) { |i| "test_user_#{generate :index}" }
      bio_is { "i'm test_user" }
      diaries_count { 0 }
    end
    
    name { "#{name_is}" }
    bio { "#{bio_is}" }

    after(:create) do |user, evaluator|
      create_list(:diary, evaluator.diaries_count, user:user) if evaluator.diaries_count.positive?
    end
  end
end
