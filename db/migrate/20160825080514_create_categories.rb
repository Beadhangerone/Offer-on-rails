$categories={'Транспорт'=>'transport',
  'Недвижимость'=>'proprety',
  'Электроника'=>'electroncs',
  'Одежда, обувь, украшения, стиль'=>'clothing',
  'Строительство, ремонт'=>'building',
  'Мебель, интерьер'=>'interior',
  'Работа'=>'jobs',
  'Туризм, развлечения'=>'entertaiment',
  'Спорт, хобби'=>'sport',
  'Музыкальные интструменты'=>'instruments',
  'Обучение, курсы'=>'courses',
  'Питомцы, растения'=>'company',
  'Все для дома и офиса'=>'allhome',
  'Еда, напитки'=>'food',
  'Видео-игры, фильмы, музыка'=>'video_games',
  'Отдам, возьму бесплатно'=>'free',
  'Находки, потери'=>'founds'
}


class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text :category
      t.text :url
    end
    $categories.each do |key, value|
      Category.create :category => "#{key}", :url => "#{value}"
    end
    add_index :categories, :category
    add_index :categories, :url
  end
end
