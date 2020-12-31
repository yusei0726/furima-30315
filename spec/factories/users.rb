FactoryBot.define do
  factory :user do
    nickname                {"test"}
    email                   {"test@example"}
    password                {"testtest1"}
    password_confirmation   {password}
    last_name_kanji         {"豊田"}
    first_name_kanji        {"優誠"}
    last_name_kana          {"トヨダ"}
    first_name_kana         {"ユウセイ"}
    birthday                {"2001-07-26"}
  end
end