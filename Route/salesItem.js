const express = require('express')
const { SelesItem } = require('../module/salesItem')
const { Item } = require('../module/items')
const route = express.Router()

route.use(express.json())

route.get('/', async(req, res) => {
    let sales = await SelesItem.find()
    if (!sales) return res.status(401).send("no item is registerd")
    res.send(sales)
})
route.get('/:id', async(req, res) => {
    let sales = await SelesItem.findById(req.params.id)
    if (!sales) return res.status(401).send("no item is registerd")
    res.send(sales)

})
route.put('/:id', async(req, res) => {
    let item_con = await Item.findById(req.body.item_id)
    let sales = await SelesItem.findById(req.params.id)
    sales.set({
        item: item_con,
        price: req.body.price,

    })
})
route.post('/', async(req, res) => {

    let item_con = await Item.findById(req.body.item_id)
    if (!item_con) return res.status(401).send("item not found")

    let sales = SelesItem({
        item: item_con,
        price: req.body.price,

    })
    try {
        await sales.save()
        res.send(sales)
    } catch (err) {
        res.send(err.message)
    }
})
route.delete('/:id', async(req, res) => {
    let sales = await SelesItem.findByIdAndRemove(req.params.id)
    if (!sales) return res.status(401).send("no item found")
    res.send(sales)
})

module.exports = route