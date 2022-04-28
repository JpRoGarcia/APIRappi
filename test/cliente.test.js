const cliente = {
    nombre: 'Juan',
    direccion: 'Calle 10 # 10 - 12',
    telefono: '123456'
}

describe('Datos de los clientes', () => {
    test('Juan existe en la lista de los clietes', () => {
        expect(cliente.nombre).toBe('Juan');
    });

    test('La dirección Calle 10 # 10 - 12 existe en la lista de los clientes', () => {
        expect(cliente.direccion).toBe('Calle 10 # 10 - 12');
    });

    test('El teléfono 123789 existe en la lista de los clientes', () => {
        expect(cliente.telefono).toBe('123456');
    });
});