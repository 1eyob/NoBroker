const express = require('express')
const { Item } = require('../module/items')
const { User } = require('../module/Users')
const route = express.Router()

route.use(express.json())

route.get('/', async(req, res) => {
    let item = await Item.find()
    if (!item) return res.status(401).send("item not found ")
    res.send(item);
})
route.get('/:id', async(req, res) => {
    let item = await Item.findById(req.params.id)
    if (!item) return res.status(401).send("item not found ")
    res.send(item);
})
route.put('/:id', async(req, res) => {
    let user = await User.findById(req.body.user_id);
    if (!user) return res.status(401).send("no user found ")
    let item = await Item.findById(req.params.id)
    if (!item) return res.status(401).send("item not found ")
    item.set({
        name: req.body.name,
        type: req.body.type,
        description: req.body,
        user: {
            _id: user._id,
            name: user.name,
            phone: user.phone,
            email: user.email,
            address: user.address
        }
    })
    try {
        await item.save()
        res.send(item)
    } catch (err) {
        res.status(404).send(err.message)
    }


})
route.post('/', async(req, res) => {
    let user = await User.findById(req.body.user_id);
    if (!user) return res.status(401).send("no user found ")
    let item = Item({
        name: req.body.name,
        type: req.body.type,
        description: req.body.description,
        user: {
            _id: user._id,
            name: user.name,
            phone: user.phone,
            email: user.email,
            address: user.address
        }

    })
    try {
        await item.save()
        res.send(item)
    } catch (err) {
        res.send(err.message)
    }
})
route.delete('/:id', async(req, res) => {
    let item = await Item.findByIdAndRemove(req.params.id)
    if (!item) return res.status(401).send("item not found ")
    res.send(item)
})

module.exports = route