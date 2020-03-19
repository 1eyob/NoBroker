const express = require('express')
const { RentalItem } = require('../module/rentalItems')
const { Item } = require('../module/items')
const route = express.Router()

route.use(express.json())

route.get('/', async(req, res) => {
    let rentalItem = await RentalItem.find()
    if (!rentalItem) return res.status(401).send("no rental item is registerd")
    res.send(rentalItem)

})
route.get('/:id', async(req, res) => {
    let rentalItem = await RentalItem.findById(req.params.id)
    if (!rentalItem) return res.status(401).send("no rental item is registerd")
    res.send(rentalItem)
})
route.put('/:id', async(req, res) => {
    let item_con = await Item.findById(req.body.item_id)
    if (!item_con) return res.status(401).send("item not found")
    let rentalItem = await RentalItem.findById(req.params.id)
    if (!rentalItem) return res.status(401).send("item not found")

    rentalItem.set({
        item: item_con,
        rentalFee: req.body.rentalFee
    })

    try {
        await rentalItem.save()
        res.send(rentalItem)

    } catch (err) {
        res.status(404).send(err.message)
    }


})
route.post('/', async(req, res) => {
    let item_con = await Item.findById(req.body.item_id)
    if (!item_con) return res.status(401).send("item not found")
    let rentalItem = RentalItem({
        item: item_con,
        rentalFee: req.body.rentalFee
    })

    //  rentalItem['_id'] = item_con._id
    try {
        await rentalItem.save()
        res.send(rentalItem)

    } catch (err) {
        res.status(404).send(err.message)
    }

})
route.delete('/:id', async(req, res) => {
    let rentalItem = await RentalItem.findByIdAndRemove(req.params.id)
    if (!rentalItem) return res.status(401).send("no rental item is registerd")
    res.send(rentalItem)
})


module.exports = route