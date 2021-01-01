FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname                {gimei.kanji}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    last_name_kanji         {gimei.last.kanji}
    first_name_kanji        {gimei.first.kanji}
    last_name_kana          {gimei.last.katakana}
    first_name_kana         {gimei.first.katakana}
    birthday                {"2001-07-26"}
  end
end