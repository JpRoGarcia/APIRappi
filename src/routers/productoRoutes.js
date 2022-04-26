const express = require('express');
const ProductosController = require("./../controllers/productoController");

const { token_imagen } = require("./../middleware/autenticacion");

var router = express.Router();

router.post("/producto", ProductosController.guardar);
router.get("/producto", ProductosController.listar);
router.get("/producto/imagen/:img", token_imagen, ProductosController.ver_imagen);

module.exports = router;