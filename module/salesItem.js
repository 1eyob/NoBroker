const mongoose = require('mongoose')
const { itemSchema } = require('./items')
mongoose.connect('mongodb://localhost/Nobroker')
    .then(() => console.log("SalesIt mongodb is connected "))
    .catch(err => console.log("SalesIt mongdb connection error ", err.message))

const SelesItemSchema = mongoose.Schema({



    item: {
        type: itemSchema
    },



    price: {
        type: Number,
        required: true,
        minLength: 1,
    },
    user: {
        type: [mongoose.Schema({
            name: String,
            email: String,
            phone: String,

        })]
    }


})

const SelesItem = mongoose.model('Items', SelesItemSchema)

exports.SelesItemSchema = SelesItemSchema
exports.SelesItem = SelesItem