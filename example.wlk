object pepita {
  var energy = 100

  method energy() = energy

  method fly(minutes) {
    energy = energy - minutes * 3
  }
}


class Plato{
  const cocinero
  const base = 100

  method cantCalorias() = 3 * self.cantAzucar() + base
  method cantAzucar()
  method esBonito()
}

class Entrada inherits Plato{
  
  override method cantAzucar() = 0
  override method esBonito() = true

}


class Principal inherits Plato{
  
  const cantAzucar
  const esBonito
  
  override method cantAzucar() = cantAzucar
  override method esBonito() = esBonito
}


class Postre inherits Plato{
  const cantColores
  override method cantAzucar() = 120

  override method esBonito() = cantColores > 3

}

object cocinero{

  var property especialidad = Chef

  method calificar(plato){
    especialidad.catar(plato)
  }

  method cambiarDeEspecialidad(nueva){
    especialidad = nueva
  }

  method cocinar() = especialidad.crear(self)
}

class Pastelero{
  const nivelDulzor

  method catar(plato) = (5* plato.cantAzucar() / nivelDulzor).min(10)

  method crear(elCocinero) = new Postre(cocinero = elCocinero, cantColores = nivelDulzor / 50)
}
class Chef{
  const cantCalorias

  method cumpleExpectativas(plato) = plato.esBonito() and plato.cantCalorias()<= cantCalorias

  method noCumpleExpectativas(plato) = 0

  method catar(plato) = if(self.cumpleExpectativas(plato)){
    return 10
    }else{self.noCumpleExpectativas(plato)}

  method crear(elCocinero) = new Principal(cocinero = elCocinero, cantAzucar = cantCalorias, esBonito = true)

}

class Souschef inherits Chef{

  override method noCumpleExpectativas(plato) = (plato.cantCalorias() / 100).min(6)

  override method crear(elCocinero) = new Entrada(cocinero = elCocinero)
}

class Torneo{
  const catadores = []

  method participar(cocinero) = cocinero.cocinar()
}