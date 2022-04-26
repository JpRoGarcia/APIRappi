const express = require('express');
const ClienteController = require("./../controllers/clienteController");

var router = express.Router();

router.get("/cliente", ClienteController.listar);

module.exports = router;