const mongoose = require('mongoose')

mongoose.connect('mongodb://localhost/Nobroker')
    .then(() => console.log("Items mongodb is connected "))
    .catch(err => console.log("Items mongdb connection error ", err.message))

const itemSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        minLength: 1,

    },
    type: {
        type: String,
        required: true,
        minLength: 1,
        maxLength: 20,
    },
    description: {
        type: String,
        required: true,


    },
    user: {
        type: mongoose.Schema({
            name: String,
            phone: Number,
            email: String,
            address: String
        })
    }
    // price: {
    //     type: Number,
    //     required: true,
    //     minLength: 1,
    //     maxLength: 100,
    // },

})

const Item = mongoose.model('Items', itemSchema)

exports.itemSchema = itemSchema
exports.Item = Item