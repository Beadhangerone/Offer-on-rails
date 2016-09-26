class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|

      t.timestamps
    end
  end
end


$subcategories={ 
"transport"=>[
      ["Легковые автомобили" ,"cars"],
      ["Грузовые автомобили", "trucks"],
      ["Мотоциклы", "motocycles"],
      ["Велосипеды", "bicycles"],
      ["Другие виды транспорта", "other_types"],
      ["Авто-техника и аксесуары", "accessories"],
      ["Авто-запчасти", "spare_parts"],
      ["Авто-сервисы", "services"],
      ["Другое", "other"]
      ],
"proprety"=>[
      ["Аренда недвижимости", "rent"],
      ["Продажа недвижимости", "sale"],
      ["Земельные участки", "land"],
      ["Комерческая недвижимость", "commercial"],
      ["Риэлторские услуги", "realtors"],
      ["Другое", "other"]
      ],
"electroncs"=>[
      ["Мобильные телефоны, планшеты", "phones"],
      ["Компьютеры, ноутбуки", "computers"],
      ["Комлектующие, оборудование", "accessories"],
      ["Офисная техника", "office"],
      ["Бытовая техника", "appliances"],
      ["Аудио-фото-видео техника", "photo_video"],
      ["Карты памяти, USB-накопители, CD", "memory"],
      ["Сервисы", "services"],
      ["Другое", "other"]
      ],
"clothing" => [
      ["Женская одежда, обувь", "women"],
      ["Мужская одежда, обувь", "men"],
      ["Детская одежда, обувь", "childrens"],
      ["Спортивная одежда", "sport"],
      ["Спец-одежда, обувь", "overall"],
      ["Аксесуары", "accessories"],
      ["Украшения", "jewelry"],
      ["Косметика", "cosmetics"],
      ["Парфюмерия", "parfumery"],
      ["Химчистка, ремонт, пошив одежды", "services"],
      ["Другое", "other"]
      ],
"building" => [
      ["Строй-материалы", "materials"],
      ["Сантехника", "sanitary"],
      ["Окна, двери", "windows"],
      ["Отопление", "heating"],
      ["Электро-проводка", "wiring"],
      ["Обои, плитка, паркет", "walls"],
      ["Инструменты, оборудование", "accessories"],
      ["Строительные услуги", "services"],
      ["Другое", "other"]
      ],
"interior" =>[
      ["Мебель", "furniture"],
      ["Мягкая мебель", "beds"],
      ["Офисная мебель", "office"],
      ["Предметы интерьера", "decorations"],
      ["Изготовление, ремонт, дизайн", "services"],
      ["Другое", "other"]
      ],
"jobs" =>[
      ["IT", "it"],
      ["Финансы", "finance"],
      ["Маркетинг", "marketing"],
      ["Журналистика, СМИ", "journalism"],
      ["Дизайн, искусство", "design"],
      ["Торговля", "trade"],
      ["Медицина", "medicine"],
      ["Туризм", "tourism"],
      ["Транспорт", "transport"],
      ["Охрана", "security"],
      ["Промышленность", "industry"],
      ["Строительство", "building"],
      ["Образование", "education"],
      ["Сельское хозяйство", "agriculture"],
      ["Другое", "other"]
      ],  
"entertaiment" => [
      ["Туризм", "tourism"],
      ["Тур-снаряжение", "equipment"],
      ["Тур-агенства", "agencies"],
      ["Охота-рыбалка", "hunting"],
      ["Развлечения, торжества", "celebration"],
      ["Другое", "other"]
      ],
"sport"=>[
      ["Спортивные клубы, бассейны, тренера", "clubs"],
      ["Спортивное сняряжение, аксесуары", "accessories"],
      ["Спортивное питание", "food"],
      ["Хобби", "hobby"],
      ["Другое", "other"]
      ],
"instruments"=>[
      ["Струнные", "strings"],
      ["Кливишные", "keyboards"],
      ["Ударные", "drums"],
      ["Духовые", "winds"],
      ["Другие тыпы музыкальных инструментов", "other_types"],
      ["Музыкальное оборудование, аксесуары", "accessories"],
      ["Репетиционные студии, звукозапись", "studio"],
      ["Другое", "other"]
      ],
"courses"=>[
      ["Иностранные языки", "foreign"],
      ["Деткие курсы, кружки", "clubs"],
      ["Автошколы", "driving"],
      ["Другие типы курсов", "other_types"],
      ["Другое", "other"]
      ],      
"company" =>[
      ["Питомцы", "pets"],
      ["Аксесуары, корма для животных", "pets_accessories"],
      ["Дрессировщики, ветеринары", "trainers"],
      ["Растения", "plants"],
      ["Садовый инвентарь, удобрения", "plants_accessories"],
      ["Другое", "other"],
      ],
"allhome" =>[
      ["Бытовой инвентарь, химия", "home_accessories"],
      ["Посуда", "dishes"],
      ["Офисные, школьные принадлежности", "office_accessories"],
      ["Другое", "other"]
      ],
"food" =>[
      ["Еда, напитки", "food"],
      ["Рестораны, бары", "pubs"],
      ["Доставка надом", "delivery"],
      ["Повара", "cooks"],
      ["Другое", "other"],
      ],
"video_games" =>[
      ["Видео-игры", "games"],
      ["фильмы", "movies"],
      ["Музыка", "music"],
      ["Другое", "other"]
      ],
"free" =>[
      ["Отдам бесплатно", "give"],
      ["Возьму бесплатно", "take"],
      ["Другое", "other"]
      ],
"founds" =>[
      ["Находки", "found"],
      ["Потери", "losses"],
      ["Другое", "other"]
      ],              
}

class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.text :category
      t.text :subcategory
      t.text :url
      t.timestamps
    end

    $subcategories.each do |key, value| 
      value.each do |item|
        Subcategory.create :category => "#{key}", :subcategory => "#{item[0].to_s}", :url => "#{item[1].to_s}"
      end
    end
  end
end