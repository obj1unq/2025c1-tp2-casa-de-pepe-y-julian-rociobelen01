import cosas.*

object casaDePepeYJulian {
    const compras = []
    const categoriaComida = comida
    var property cuenta = cuentaCorriente

    method compras(){
      return compras
    }
    method comprar(cosa){
      cuenta.extraer(cosa.precio())
      compras.add(cosa)
    }

    method cantidadDeCosasCompradas() {
      return compras.size()
    }
    
    method tieneAlgun(categoria) {
      return compras.any({compra => compra.categoria() == categoria })
    }

    method vieneDeComprar(categoria) {
      return compras.last().categoria() == categoria 
    }
    
    method esDerrochona(){
      return compras.sum{compra => compra.precio()} >= 9000
    }

    method compraMasCara(){
      return compras.max({ compra => compra.precio()})
    }

    method comprados(categoria){
      return compras.filter({compra => compra.categoria() == categoria })
    } 
    
    method malaEpoca(){
      return compras.all({compra => compra.categoria() == categoriaComida})
    }

    method queFaltaComprar(lista){
      return lista.filter({cosa => !compras.contains(cosa)})
    } 

    method faltaComida() {
      return compras.filter({compra => compra.categoria() == categoriaComida}).size() < 2 
// O  return self.comprados(comida) < 2 (uso un metodo ya definido)
    }

    method categoríasCompradas(){
      return compras.map({compra => compra.categoria()}).asSet()
    } 
}

object cuentaCorriente {
    var property saldo = 0

    method saldo(){
      return saldo
    }
    method depositar(monto){
      saldo = saldo + monto
    }

    method extraer(monto) {
      self.validarExtraccion(monto)
      saldo = saldo - monto
    }

    method validarExtraccion(monto){
      if (monto > self.saldo()){
        self.error("Saldo insuficiente")
      }
    }
}

object cuentaGasto {
  var property saldo = 0
  var property costoPorOperacion = 0

    method depositar(monto){
      self.validarDeposito(monto)
      saldo = saldo + monto - costoPorOperacion
    }

    method validarDeposito(monto){
      if (monto > 1000){
        self.error("No se permite depositar mas de $1000")
      }
    }

    method extraer(monto) {
      saldo = saldo - monto
    }

}
