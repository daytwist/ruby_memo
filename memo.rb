require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集)"

memo_type = gets.chop.to_s
case_pattern = ""

if memo_type == "1"
  case_pattern = "新規作成"
elsif memo_type == "2"
  case_pattern = "編集"
else
  case_pattern = "終了"
end

case case_pattern
when "新規作成"
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chop
  puts "メモ内容を入力してください"
  puts "完了したら Ctrl + D を押してください"
  content = $stdin.read.to_s
  CSV.open("#{file_name}.csv", "w") do |csv|
    csv << [content]
  end
  puts "メモを作成しました"
when "編集"
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chop
  current_content = CSV.read("#{file_name}.csv")
  puts "メモ内容：#{current_content}"
  puts "追記する内容を入力してください"
  puts "完了したら Ctrl + D を押してください"
  content = $stdin.read.to_s
  CSV.open("#{file_name}.csv", "a") do |csv|
    csv << [content]
  end
  puts "メモを編集しました"
when "終了"
  puts "終了します"
end
