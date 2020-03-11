const express = require('express')
const { User } = require('../module/Users')
const route = express.Router()

route.use(express.json())

route.get('/', async(req, res) => {
    let user = await User.find();
    if (!user) return res.status(401).send("user not found")
    res.send(user)

})
route.get('/:id', async(req, res) => {

    let user = await User.findOne({ "email": req.body.email });
    if (!user) return res.status(401).send("user not found")
    res.send(user)

    return res.send("nooo")
        //user = await User.findOne({"email":body.email})
    if (!user) return res.status(401).send("user not found")
    res.send(user)

})
route.get('/login', async(req, res) => {
    print("working")
    let user = await User.findOne({ "email": req.headers('email') });
    if (!user) return res.status(401).send("user not found")
    res.send(user)

    return res.send("nooo")
        //user = await User.findOne({"email":body.email})
    if (!user) return res.status(401).send("user not found")
    res.send(user)

})
route.put('/:id', async(req, res) => {
    let user = await User.findById(req.params.id);
    if (!user) return res.status(401).send("user not found")
    user.set({
        name: req.hearder('x-name'),
        email: req.body.email,
        password: req.body.password,
        phone: req.body.phone,
        address: req.body.address,
        isOrganization: req.body.isOrganization
    })
    res.send(user)
})
route.post('/', async(req, res) => {

    let user = User({
        name: req.body.name,
        email: req.body.email,
        password: req.body.password,
        phone: req.body.phone,
        address: req.body.address,
        isOrganization: req.body.isOrganization

    })

    try {
        await user.save()
        res.send(user)
    } catch (err) {
        res.status(404).send(err.message)
    }


})
route.delete('/:id', async(req, res) => {
    let user = await User.findByIdAndRemove(req.params.id)
    res.send(user)
})

module.exports = route