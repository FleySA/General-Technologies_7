В рамках БД "music" напишите след/запросы:


1.Вывести незаблокированных юзеров из Germany и USA:

db.users.find({
    $and: [
    {is_blocked: {$ne: true} },  // пользователь не заблоkирован
    {country: {$in: ["Germany", "USA"] } } // пользователm из Germany и USA
    ]
})


2. Вывести названия треков продолжительностью от 5 до 15 мин:
db.tracks1.find(
    {
        duration_secs: { $gte: 5 * 60, $lte: 15 * 60 }
    }
)


3.Разблокировать юзеров не из Germany:
db.users.updateMany(
    { country: { $ne: "Germany" } }, // фильтр: пользователи не из Germany
    { $set: { is_blocked: false } } // операция: установить поле is_blocked в false
)


4.Увеличить баланс назаблокированных юзеров не из Germany на 150 EUR:
db.users.updateMany(
    {
        is_blocked: { $ne: true }, // фильтр: пользователи не заблокированы
        country: { $ne: "Germany" } // фильтр: пользователи не из Germany
    },
    { $inc: { balance: 150 } } // операция: увеличить баланс на 150 EUR
)


5.Опишите схему БД "соц/сеть" (юзеры, публикации, друзья, чаты):
https://dbdiagram.io/d/65ca2345ac844320aef6009b

