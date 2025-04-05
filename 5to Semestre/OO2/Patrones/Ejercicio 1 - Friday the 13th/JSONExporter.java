@startuml

skinparam classAttributeIconSize 0

class Biblioteca {
+Biblioteca()
+agregarSocio(socio: Socio)
+exportarSocios(): String
+getExporter(): VoorheesExporter
+setExporter(exporter: VoorheesExporter)
}

class Socio {
-nombre: String
-legajo: String
-email: String
+Socio(nombre: String, email: String, legajo: String)
+getNombre(): String
+setNombre(nombre: String)
+getEmail(): String
+setEmail(email: String)
+getLegajo(): String
+setLegajo(legajo: String)
}

interface IExporter {
+<<abstract>> exportar(socios: Socio[*]): String
}

class VoorheesExporter implements IExporter {
-exportar(socio: Socio): String
}

class JSONExporter implements IExporter {
-exportar(socio: Socio): JSONObject
}

Biblioteca -right-* IExporter: -exporter
Biblioteca --> Socio: -socios 0..*

@enduml
